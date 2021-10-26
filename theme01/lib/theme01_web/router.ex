defmodule Theme01Web.Router do
  use Theme01Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {Theme01Web.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Theme01Web do
    pipe_through :api

    resources "/users", UserController, only: [:show, :create, :delete] do
      put "/", UserController, :update
    end

    get "/users", UserController, :get_by_infos

    post "/clocks/:userId", ClockController, :create
    get "/clocks/:userId", ClockController, :index

    resources "/workingtimes", WorkingtimeController, only: [:delete, :show]
    post "/workingtimes/:userId", WorkingtimeController, :create
    put "/workingtimes/:id", WorkingtimeController, :update
    get "/workingtimes/user/:userId", WorkingtimeController, :get_all
  end
end
