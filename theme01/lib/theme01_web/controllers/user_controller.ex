defmodule Theme01Web.UserController do
  use Theme01Web, :controller

  alias Theme01.App
  alias Theme01.App.User

  action_fallback Theme01Web.FallbackController

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- App.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def get_by_infos(conn, %{"email" => email, "username" => username}) do
    user = App.get_by_infos(email, username)
    render(conn, "show.json", user: user)
  end

  def show(conn, %{"id" => id}) do
    user = App.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"user_id" => id, "user" => user_params}) do
    user = App.get_user!(id)

    with {:ok, %User{} = user} <- App.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = App.get_user!(id)

    with {:ok, %User{}} <- App.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
