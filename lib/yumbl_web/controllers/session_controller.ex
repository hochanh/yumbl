defmodule YumblWeb.SessionController do
  use YumblWeb, :controller

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(
    conn,
    %{"session" => %{"username" => username, "password" => password}}
  ) do
    case Yumbl.Accounts.authenticate_using_password(username, password) do
      {:ok, user} ->
        conn
        |> YumblWeb.Auth.login(user)
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Username and password mismatch")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> YumblWeb.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
