defmodule Back.AuthPlug do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    case Back.App.check_token(get_jwt(conn)) do
      {:ok, claims} -> success(conn, claims)
      {:error, message} -> forbidden(conn, message)
    end
  end

  def get_jwt(conn) do
    conn
    |> get_req_header("authorization")
    |> List.first()
    |> String.split()
    |> List.last()
  end

  def success(conn, %{"id" => id, "role" => role}) do
    conn
    |> assign(:id, id)
    |> assign(:role, role)
  end

  def forbidden(conn, message) do
    conn
    |> put_status(:unauthorized)
    |> Phoenix.Controller.render(BackWeb.UserView, "error.json", message: message)
    |> halt()
  end
end
