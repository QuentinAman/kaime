defmodule BackWeb.TeamController do
  use BackWeb, :controller

  alias Back.App
  alias Back.App.Team

  action_fallback BackWeb.FallbackController

  def index(conn, _params) do
    teams = App.list_teams()
    render(conn, "index.json", teams: teams)
  end

  def create(conn, %{"team" => team_params}) do
    with {:ok, %Team{} = team} <- App.create_team(team_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.team_path(conn, :show, team))
      |> render("show.json", team: team)
    end
  end

  def show(conn, %{"id" => id}) do
    team = App.get_team!(id)
    render(conn, "show.json", team: team)
  end

  def update(conn, %{"id" => id, "team" => team_params}) do
    team = App.get_team!(id)

    with {:ok, %Team{} = team} <- App.update_team(team, team_params) do
      render(conn, "show.json", team: team)
    end
  end

  def delete(conn, %{"id" => id}) do
    team = App.get_team!(id)

    with {:ok, %Team{}} <- App.delete_team(team) do
      conn
      |> Phoenix.Controller.render(BackWeb.WorkingtimeView, "message.json", message: "ok")
    end
  end
end
