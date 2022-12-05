defmodule StreamCsvWeb.PageController do
  use StreamCsvWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
