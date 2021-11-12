defmodule BackWeb.Router do
  use BackWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(CORSPlug)
  end

  pipeline :auth do
    plug(Back.AuthPlug)
  end

  pipeline :admin do
    plug(Back.AdminPlug)
  end

  pipeline :manager do
    plug(Back.ManagerPlug)
  end

  scope "/api", BackWeb do
    pipe_through(:api)

    # GLOBAL ROUTES
    post("/sign_up", UserController, :signup)
    post("/sign_in", UserController, :signin)

    # USER ROUTES
    scope "/self" do
      pipe_through(:auth)
      get("/", UserController, :get_self)
      patch("/", UserController, :update)
      delete("/", UserController, :delete)
      patch("/password", UserController, :update_password)

      # WORKINGTIME ROUTES
      get("/workingtimes", WorkingtimeController, :get_mines)
      post("/workingtimes", WorkingtimeController, :create)
      delete("/workingtimes/:id", WorkingtimeController, :delete)
      patch("/workingtimes/:id", WorkingtimeController, :update)

      # CLOCK ROUTES
      get("/clock", ClockController, :show)
      patch("/clock", ClockController, :update)
    end

    # ADMIN ROUTES
    scope "/admin" do
      pipe_through(:auth)
      pipe_through(:admin)

      delete("/user", UserController, :delete_user)
      get("/", UserController, :index)
      patch("/update_role", UserController, :update_role)
      get("/teams", TeamController, :index)
      post("/teams", TeamController, :create)
      patch("/teams/:id", TeamController, :update)
      patch("/teams/:id/manager", UserController, :add_manager)
      delete("/teams/:id", TeamController, :delete)
    end

    # MANAGER ROUTES
    scope "/manager" do
      pipe_through(:auth)
      pipe_through(:manager)

      get("/team", TeamController, :show)
      post("/team", UserController, :add_user)
      patch("/team", UserController, :remove_user)
    end
  end
end
