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

    # GLOBAL ROUTES
    post "/sign_up", UserController, :signup
    post "/sign_in", UserController, :signin

    # USER ROUTES
    scope "/self" do
      pipe_through :auth
      get "/", UserController, :get_self
      # TODO
      patch "/", UserController, :update
      delete "/", UserController, :delete

      # WORKINGTIME ROUTES
      get "/workingtimes", WorkingtimeController, :get_mines
      post "/workingtime", WorkingtimeController, :create
      delete "/workingtime", WorkingtimeController, :delete
      patch "/workingtime", WorkingtimeController, :update

      # CLOCK ROUTES
      get "/clock", ClockController, :show
      patch "/clock", ClockController, :update
    end

    # ADMIN ROUTES
    # TODO
    scope "/admin" do
      pipe_through :auth
      # pipe_through :admin

      delete "/user", UserController, :delete_user
      get "/", UserController, :index
    end

    # MANAGER ROUTES
    # TODO
    scope "/manager" do
      pipe_through :auth
      # pipe_through :manager

      get "/team", TeamController, :show
      post "/team", TeamController, :add_to_team
      patch "/team", TeamController, :remove_from_team
    end
  end
end
