defmodule PhxCqrs.Todo do
    @moduledoc """
  The boundary for the Accounts system.
  """

  alias PhxCqrs.Commands.{CreateTodoList}
  alias PhxCqrs.Projections.TodoListProjection
  alias PhxCqrs.Todos.{Repo,Router}

  @doc """
  Create a new todo list
  """
  def create_todolist(attrs \\ %{}) do
    uuid = UUID.uuid4()

    todo_list =
      attrs
      |> CreateTodoList.new()
      |> CreateTodoList.assign_uuid(uuid)

    with :ok <- Router.dispatch(todo_list, consistency: :strong) do
      get(TodoListProjection, uuid)
    else
      reply -> reply
    end
  end

  def get(id) do
    get(TodoListProjection, id)
  end

  def all() do
    Repo.all(TodoListProjection)
  end

  defp get(schema, uuid) do
    case Repo.get(schema, uuid) do
      nil -> {:error, :not_found}
      projection -> {:ok, projection}
    end
  end
end
