defmodule PhxCqrs.Todos do
  alias PhxCqrs.Commands.{CreateTodoList,AddTodoItem,CompleteTodoItem}
  alias PhxCqrs.Events.{TodoListCreated,TodoItemAdded,TodoItemCompleted}
  alias PhxCqrs.Todos

  defstruct [:id, :description, :items, :completed]


  @moduledoc """
  Documentation for PhxCqrs.Todos.
  """


  # public command API
  def execute(%Todos{id: nil, description: nil, items: nil} = todo,
              %CreateTodoList{id: id, description: description}) do
    %TodoListCreated{id: id, description: description}
  end

  # ensure todolist has not already been opened
  def execute(%Todos{}, %CreateTodoList{}) do
    {:error, :todo_list_already_created}
  end

  # state mutators

  def apply(%Todos{} = todo, %TodoListCreated{id: id, description: description}) do
    %Todos{todo |
      id: id,
      description: description,
      items: [],
      completed: false
    }
  end
end
