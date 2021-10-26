defmodule Theme01Web.ClockController do
  use Theme01Web, :controller

  alias Theme01.App
  alias Theme01.App.Clock

  action_fallback Theme01Web.FallbackController

  def create(conn, %{"userId" => id, "clock" => clock_params}) do
    clock = App.get_clock_by_user(id)

    if is_nil(clock) do
      data = Map.put(clock_params, "user", id)

      with {:ok, %Clock{} = clock} <- App.create_clock(data) do
        conn
        |> put_status(:created)
        |> render("show.json", clock: clock)
      end
    end

    with {:ok, %Clock{} = clock} <- App.update_clock(clock, %{status: false}) do
      render(conn, "show.json", clock: clock)
    end
  end

  def index(conn, %{"userId" => id}) do
    clock = App.get_clock_by_user(id)
    render(conn, "show.json", clock: clock)
  end
end
