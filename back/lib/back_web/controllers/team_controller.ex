defmodule BackWeb.TeamController do
  use BackWeb, :controller

  alias Back.App
  alias Back.App.Team

  action_fallback(BackWeb.FallbackController)

  def index(conn, _params) do
    teams = App.list_teams()
    render(conn, "index.json", teams: teams)
  end

  def create(conn, %{"name" => name}) do
    with {:ok, %Team{} = team} <- App.create_team(%{"name" => name}) do
      conn
      |> put_status(:created)
      |> render("show_one.json", team: team)
    end
  end

  def show(conn, _req) do
    user = App.get_user!(conn.assigns[:id])
    {:ok, %Team{} = team} = App.get_team!(user.team)
    users = App.get_users_by_team(user.team)
    render(conn, "show.json", team: team, users: users)
  end

  def update(conn, %{"id" => id, "name" => name}) do
    {:ok, team} = App.get_team!(id)

    with {:ok, %Team{} = team} <- App.update_team(team, %{"name" => name}) do
      render(conn, "show_one.json", team: team)
    end
  end

  def delete(conn, %{"id" => id}) do
    {:ok, team} = App.get_team!(id)

    try do
      App.delete_team(team)
      render(conn, "message.json", message: "Supprimée avec succès")
    rescue
      _ ->
        render(conn, "error.json",
          message: "Une erreur est survenue, supprimez les membres avant l'équipe."
        )
    end
  end
end
