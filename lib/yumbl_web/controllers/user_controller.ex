defmodule YumblWeb.UserController do
  use YumblWeb, :controller

  alias Yumbl.Accounts

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.html", users: users)
  end
end
