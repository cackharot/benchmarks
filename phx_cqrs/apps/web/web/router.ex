defmodule PhxCqrs.Web.Router do
  use PhxCqrs.Web.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhxCqrs.Web do
    pipe_through :api

    resources "/todos", TodoController, except: [:new, :edit]
  end
end
