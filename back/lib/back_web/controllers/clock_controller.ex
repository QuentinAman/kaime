defmodule BackWeb.ClockController do
  use BackWeb, :controller

  alias Back.App
  alias Back.App.Clock

  action_fallback BackWeb.FallbackController

  def create(conn, %{"clock" => clock_params}) do
    with {:ok, %Clock{} = clock} <- App.create_clock(clock_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
      |> render("show.json", clock: clock)
    end
  end

  def show(conn, _req) do
    clock = App.get_clock!(conn.assigns[:id])
    render(conn, "show.json", clock: clock)
  end

  def update(conn, %{"time" => time}) do
    user = App.get_user!(conn.assigns[:id])
    clock = App.get_clock!(user.clock)

    case clock.status do
      false ->
        with {:ok, %Clock{} = clock} <-
               App.update_clock(clock, %{"status" => true, "time" => time}) do
          render(conn, "show.json", clock: clock)
        end

      true ->
        with {:ok, %Clock{} = updated_clock} <-
               App.update_clock(clock, %{
                 "status" => false,
                 "time" => nil,
                 "description" => "Description..."
               }) do
          users_workingtime =
            Map.put(
              %{"start" => clock.time, "end" => time},
              "user",
              conn.assigns[:id]
            )

          with {:ok, %Back.App.Workingtime{}} <- App.create_workingtime(users_workingtime) do
            render(conn, "show.json", clock: updated_clock)
          end
        end
    end
  end

  def delete(conn, %{"id" => id}) do
    clock = App.get_clock!(id)

    with {:ok, %Clock{}} <- App.delete_clock(clock) do
      send_resp(conn, :no_content, "")
    end
  end
end
