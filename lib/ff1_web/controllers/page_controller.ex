defmodule Ff1Web.PageController do
  use Ff1Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
