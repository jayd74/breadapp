defmodule Breadapp.PageController do
  use Breadapp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
