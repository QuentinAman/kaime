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
      email: user.email,
      role: user.role,
      firstname: user.firstname,
      lastname: user.lastname
    }
  end

  def render("message.json", %{message: message}) do
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
          firstname: auth.user.firstname,
          lastname: auth.user.lastname,
          email: auth.user.email,
          role: auth.user.role
        }
      }
    }
  end
end
