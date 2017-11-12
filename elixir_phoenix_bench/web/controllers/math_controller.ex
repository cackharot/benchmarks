defmodule PhxBenchApi.MathController do
  use PhxBenchApi.Web, :controller

  def sum(conn, %{"a" => a, "b" => b}) do
    json conn, %{data: a+b}
  end
end
