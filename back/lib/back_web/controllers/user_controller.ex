defmodule BackWeb.UserController do
  use BackWeb, :controller

  alias Back.App
  alias Back.App.User

  action_fallback(BackWeb.FallbackController)

  def signup(conn, user) do
    case App.create_user(user) do
      {:ok, %User{} = createdUser} ->
        conn
        |> put_status(:created)
        |> render("show.json", user: createdUser)

      {:error, message} ->
        conn
        |> render("message.json", message: message)
    end
  end

  def signin(conn, %{"email" => email, "password" => password}) do
    case App.login(email, password) do
      {:ok, %{} = auth} ->
        conn
        |> render("auth.json", auth: auth)

      {:error, message} ->
        conn
        |> render("message.json", message: message)
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
    if(Map.has_key?(user_params, "role") || Map.has_key?(user_params, "email")) do
      render(conn, "message.json", message: "Ces champs ne peuvent pas être modifé")
    else
      user = App.get_user!(conn.assigns[:id])

      with {:ok, %User{} = user} <- App.update_user(user, user_params) do
        render(conn, "show.json", user: user)
      end
    end
  end

  def update_password(conn, %{"password" => password}) do
    user = App.get_user!(conn.assigns[:id])

    with {:ok, %User{}} <- App.update_password(user, %{"password" => password}) do
      render(conn, "message.json", message: "Mot de passe modifié avec succès.")
    end
  end

  def delete(conn, _req) do
    user = App.get_user!(conn.assigns[:id])

    with {:ok, %User{}} <- App.delete_user(user) do
      conn
      |> Phoenix.Controller.render(BackWeb.WorkingtimeView, "message.json",
        message: "Supprimé avec succès."
      )
    end
  end

  def delete_user(conn, %{"user_id" => user_id}) do
    user = App.get_user!(user_id)

    with {:ok, %User{}} <- App.delete_user(user) do
      conn
      |> Phoenix.Controller.render(BackWeb.WorkingtimeView, "message.json",
        message: "Supprimé avec succès."
      )
    end
  end

  def update_role(conn, %{"user_id" => user_id, "role" => role}) do
    user = App.get_user!(user_id)

    with {:ok, %User{} = user} <- App.update_user(user, %{"role" => role}) do
      render(conn, "show.json", user: user)
    end
  end

  def add_manager(conn, %{"id" => team_id, "user" => user_email}) do
    add_teammate(conn, team_id, user_email, 1)
  end

  def add_user(conn, %{"user" => user_email}) do
    user = App.get_user!(conn.assigns[:id])
    {:ok, team} = App.get_team!(user.team)
    add_teammate(conn, team.id, user_email, 0)
  end

  def add_teammate(conn, team_id, user_email, role) do
    cond do
      {:error, "L'utilisateur n'existe pas"} == App.get_user_by_email!(user_email) ->
        render(conn, "error.json", message: "L'utilisateur n'existe pas")

      {:error, "L'équipe n'existe pas"} == App.get_team!(team_id) ->
        IO.inspect("test")
        render(conn, "error.json", message: "L'équipe n'existe pas")

      true ->
        {:ok, %User{} = user} = App.get_user_by_email!(user_email)

        with {:ok, %User{}} <-
               App.update_user(user, %{
                 "role" => role,
                 "team" => team_id
               }) do
          render(conn, "message.json", message: "Un nouvel équipier a été ajouté")
        end
    end
  end

  def remove_manager(conn, %{"id" => team_id, "user" => user_email}) do
    remove_teammate(conn, team_id, user_email)
  end

  def remove_user(conn, %{"user" => user_email}) do
    user = App.get_user!(conn.assigns[:id])
    {:ok, team} = App.get_team!(user.team)
    remove_teammate(conn, team.id, user_email)
  end

  def remove_teammate(conn, team_id, user_email) do
    res_user = App.get_user_by_email!(user_email)
    res_team = App.get_team!(team_id)

    {:ok, user} = res_user

    cond do
      {:error, "L'utilisateur n'existe pas"} == res_user ->
        render(conn, "error.json", message: "L'utilisateur n'existe pas")

      {:error, "L'équipe n'existe pas"} == res_team ->
        render(conn, "error.json", message: "L'équipe n'existe pas")

      user.team != team_id ->
        render(conn, "error.json", message: "L'utilisateur ne fait pas parti de l'équipe")

      user.team == nil ->
        render(conn, "error.json", message: "L'utilisateur ne fait pas parti d'une équipe")

      true ->
        with {:ok, %User{}} <-
               App.update_user(user, %{
                 "role" => 0,
                 "team" => nil
               }) do
          render(conn, "message.json", message: "L'équipier a été supprimé")
        end
    end
  end
end
