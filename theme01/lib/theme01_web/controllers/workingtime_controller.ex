defmodule Theme01Web.WorkingtimeController do
  use Theme01Web, :controller

  alias Theme01.App
  alias Theme01.App.Workingtime

  action_fallback Theme01Web.FallbackController

  def get_all(conn, %{"userId" => id, "end" => ending, "start" => starting}) do
    workingtimes = App.get_all_by_user(id, ending, starting)
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def create(conn, %{"userId" => id, "workingtime" => workingtime_params}) do
    data = Map.put(workingtime_params, "user", id)

    with {:ok, %Workingtime{} = workingtime} <- App.create_workingtime(data) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.workingtime_path(conn, :show, workingtime))
      |> render("show.json", workingtime: workingtime)
    end
  end

  def show(conn, %{"id" => id}) do
    workingtime = App.get_workingtime(id)
    render(conn, "show.json", workingtime: workingtime)
  end

  def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
    workingtime = App.get_workingtime(id)

    with {:ok, %Workingtime{} = workingtime} <-
           App.update_workingtime(workingtime, workingtime_params) do
      render(conn, "show.json", workingtime: workingtime)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtime = App.get_workingtime(id)

    with {:ok, %Workingtime{}} <- App.delete_workingtime(workingtime) do
      send_resp(conn, :no_content, "")
    end
  end
end
