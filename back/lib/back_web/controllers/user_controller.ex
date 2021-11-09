defmodule BackWeb.UserController do
  use BackWeb, :controller

  alias Back.App
  alias Back.App.User

  action_fallback BackWeb.FallbackController

  def signup(conn, user) do
    case App.create_user(user) do
      {:ok, %User{} = createdUser} ->
        conn
        |> put_status(:created)
        |> render("show.json", user: createdUser)

      {:error, message} ->
        conn
        |> render("error.json", message: message)
    end
  end

  def signin(conn, %{"email" => email, "password" => password}) do
    case App.login(email, password) do
      {:ok, %{} = auth} ->
        conn
        |> render("auth.json", auth: auth)

      {:error, message} ->
        conn
        |> render("error.json", message: message)
    end
  end

  def index(conn, _params) do
    users = App.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- App.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = App.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def get_self(conn, _req) do
    user = App.get_user!(conn.assigns[:id])
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"user" => user_params}) do
    user = App.get_user!(conn.assigns[:id])

    with {:ok, %User{} = user} <- App.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, _req) do
    user = App.get_user!(conn.assigns[:id])

    with {:ok, %User{}} <- App.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

  def delete_user(conn, %{"user_id" => user_id}) do
    user = App.get_user!(user_id)

    with {:ok, %User{}} <- App.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

  def update_role(conn, %{"user_id" => user_id, "role" => role}) do
    user = App.get_user!(user_id)

    with {:ok, %User{} = user} <- App.update_user(user, %{"role" => role}) do
      render(conn, "show.json", user: user)
    end
  end
end
