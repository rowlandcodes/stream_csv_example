defmodule StreamCsvWeb.Router do
  use StreamCsvWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {StreamCsvWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", StreamCsvWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/export", ExportController, :create
  end
end
