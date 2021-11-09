defmodule BackWeb.WorkingtimeController do
  use BackWeb, :controller

  alias Back.App
  alias Back.App.Workingtime

  action_fallback BackWeb.FallbackController

  def create(conn, workingtime_params) do
    users_workingtime = Map.put(workingtime_params, "user", conn.assigns[:id])

    with {:ok, %Workingtime{} = workingtime} <- App.create_workingtime(users_workingtime) do
      conn
      |> put_status(:created)
      |> render("show.json", workingtime: workingtime)
    end
  end

  def get_mines(conn, _) do
    workingtimes = App.get_my_workingtimes(conn.assigns[:id])
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
    workingtime = App.get_workingtime!(id)

    if(workingtime.user == conn.assigns[:id]) do
      with {:ok, %Workingtime{} = workingtime} <-
             App.update_workingtime(workingtime, workingtime_params) do
        send_resp(conn, :no_content, "")
      end
    else
      render("error.json", message: "not_yours")
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtime = App.get_workingtime!(id)

    if(workingtime.user == conn.assigns[:id]) do
      with {:ok, %Workingtime{}} <- App.delete_workingtime(workingtime) do
        conn
        |> Phoenix.Controller.render(BackWeb.WorkingtimeView, "message.json", message: "ok")
      end
    else
      render("message.json", message: "not_yours")
    end
  end
end
