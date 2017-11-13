defmodule PhxCqrs.Projections.TodoListProjection do
    use Ecto.Schema

    @primary_key {:id, :binary_id, autogenerate: false}

    schema "todo_list_projection" do
        field :description, :string, unique: true
        field :completed, :boolean, unique: false

        timestamps()
    end
end
