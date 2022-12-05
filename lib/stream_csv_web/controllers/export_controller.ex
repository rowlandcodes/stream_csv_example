defmodule StreamCsvWeb.ExportController do
  use StreamCsvWeb, :controller
  alias StreamCsv.Repo
  import Ecto.Query

  def create(conn, _params) do
    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=\"data.csv\"")
    |> send_chunked(200)
    |> export()
  end

  defp export(conn) do
    big_expensive_query =
      from(a in StreamCsv.Data.Point,
        cross_join: b in StreamCsv.Data.Point,
        on: a.name == b.name,
        cross_join: c in StreamCsv.Data.Point,
        on: a.name == c.name
      )

    {:ok, conn} =
      Repo.transaction(fn ->
        big_expensive_query
        |> Repo.stream(max_rows: 500)
        |> CSV.encode(headers: [:name, :value])
        # big_expensive_query returns 1 billion rows,
        # Stream.take prevent any demo from taking forever 
        |> Stream.take(10000)
        |> Stream.chunk_every(500)
        |> Enum.reduce_while(conn, fn data, conn ->
          case chunk(conn, data) do
            {:ok, conn} ->
              {:cont, conn}

            {:error, :closed} ->
              {:halt, conn}
          end
        end)
      end)

    conn
  end
end
