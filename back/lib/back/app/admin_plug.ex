defmodule Back.AuthPlug do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    if conn.assigns[:role] == 2 do
      success(conn)
    else
      forbidden(conn, "not_enough_rights")
    end
  end

  def success(conn) do
    conn
  end

  def forbidden(conn, message) do
    conn
    |> put_status(:unauthorized)
    |> Phoenix.Controller.render(BackWeb.UserView, "error.json", message: message)
    |> halt()
  end
end
