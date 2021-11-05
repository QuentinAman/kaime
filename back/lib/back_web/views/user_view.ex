defmodule BackWeb.UserView do
  use BackWeb, :view
  alias BackWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      username: user.username,
      email: user.email,
      role: user.role,
      firstname: user.firstname,
      lastname: user.lastname
    }
  end

  def render("error.json", %{message: message}) do
    %{
      message: message
    }
  end

  def render("auth.json", %{auth: auth}) do
    %{
      message: "connected",
      data: %{
        token: auth.token,
        user: %{
          username: auth.user.username,
          firstname: auth.user.firstname,
          lastname: auth.user.lastname,
          email: auth.user.username,
          role: auth.user.role
        }
      }
    }
  end
end
