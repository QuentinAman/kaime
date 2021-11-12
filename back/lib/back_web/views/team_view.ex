defmodule BackWeb.TeamView do
  use BackWeb, :view
  alias BackWeb.TeamView

  def render("index.json", %{teams: teams}) do
    %{data: render_many(teams, TeamView, "team.json")}
  end

  def render("show.json", %{team: team}) do
    %{data: render_one(team, TeamView, "team.json")}
  end

  def render("team.json", %{team: team}) do
    %{
      id: team.id,
      name: team.name
    }
  end

  def render("message.json", %{message: message}) do
    %{
      message: message
    }
  end

  def render("error.json", %{message: message}) do
    %{
      message: message
    }
  end
end
