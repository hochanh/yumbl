defmodule YumblWeb.PageControllerTest do
  use YumblWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Yumbl!"
  end
end
