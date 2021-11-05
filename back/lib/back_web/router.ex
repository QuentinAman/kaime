defmodule BackWeb.Router do
  use BackWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug Back.AuthPlug
  end

  scope "/api", BackWeb do
    pipe_through :api

    post "/sign_up", UserController, :signup
    post "/sign_in", UserController, :signin

    scope "/users" do
      pipe_through :auth
      get "/", UserController, :index
    end
  end
end
