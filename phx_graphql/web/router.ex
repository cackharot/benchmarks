defmodule PhxGraphql.Router do
  use PhxGraphql.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhxGraphql do
    pipe_through :api
  end
end
