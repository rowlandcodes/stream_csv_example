defmodule StreamCsv.Repo do
  use Ecto.Repo,
    otp_app: :stream_csv,
    adapter: Ecto.Adapters.SQLite3
end
