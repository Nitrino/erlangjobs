defmodule Erlangjobs.PageControllerTest do
  use Erlangjobs.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Erlang Jobs"
  end
end
