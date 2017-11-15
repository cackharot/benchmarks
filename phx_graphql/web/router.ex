defmodule PhxGraphql.Router do
  use PhxGraphql.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: PhxGraphql.Schema,
      interface: :simple,
      context: %{pubsub: PhxGraphql.Endpoint}
  end
end
