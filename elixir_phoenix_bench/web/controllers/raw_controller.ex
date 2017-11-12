defmodule PhxBenchApi.RawController do
  use PhxBenchApi.Web, :controller

  def index(conn, _params) do
    text conn, "Welcome!"
  end
end
