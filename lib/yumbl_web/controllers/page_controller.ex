defmodule YumblWeb.PageController do
  use YumblWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
