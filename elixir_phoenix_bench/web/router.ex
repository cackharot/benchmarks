defmodule PhxBenchApi.Router do
  use PhxBenchApi.Web, :router

  pipeline :api do
    # plug :accepts, ["json"]
    plug :accepts, ["json-api"]
    plug JaSerializer.ContentTypeNegotiation
    plug JaSerializer.Deserializer
  end

  scope "/api", PhxBenchApi do
    pipe_through :api

    resources "/todos", TodoController, except: [:new, :edit]
    post "/sum", MathController, :sum
    get "/raw", RawController, :index
  end
end
