defmodule BackWeb.Router do
  use BackWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug CORSPlug
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
      get "/self", UserController, :get_self

      get "/workingtimes", WorkingtimeController, :get_mines
      post "/workingtime", WorkingtimeController, :create
      delete "/workingtime", WorkingtimeController, :delete
      patch "/workingtime", WorkingtimeController, :update

      get "/clock", ClockController, :show
      patch "/clock", ClockController, :update
    end

    scope "/admin" do
      pipe_through :auth
      pipe_through :admin
    end

    scope "/manager" do
      pipe_through :auth
      pipe_through :manager

      get "/team", TeamController, :show
    end
  end
end
