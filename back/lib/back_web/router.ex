defmodule BackWeb.Router do
  use BackWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BackWeb do
    pipe_through :api

    post "/sign_up", UserController, :signup
    post "/sign_in", UserController, :signin
  end
end
