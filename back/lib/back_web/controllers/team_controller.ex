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
      |> render("show.json", team: team)
    end
  end

  def show(conn, %{"id" => id}) do
    team = App.get_team!(id)
    render(conn, "show.json", team: team)
  end

  def update(conn, %{"id" => id, "name" => name}) do
    {:ok, team} = App.get_team!(id)

    with {:ok, %Team{} = team} <- App.update_team(team, %{"name" => name}) do
      render(conn, "show.json", team: team)
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
