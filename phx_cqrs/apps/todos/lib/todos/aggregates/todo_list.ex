defmodule PhxCqrs.Aggregates.TodoList do
  @moduledoc """
  Documentation for PhxCqrs.Aggregates.TodoList.
  """

  defstruct [:id, :description, :items, :completed]

  alias PhxCqrs.Commands.{CreateTodoList,AddTodoItem,CompleteTodoItem}
  alias PhxCqrs.Events.{TodoListCreated,TodoItemAdded,TodoItemCompleted}
  alias PhxCqrs.Aggregates.TodoList

  # public command API
  def execute(%TodoList{id: nil} = todo,
              %CreateTodoList{id: id, description: description}) do
    %TodoListCreated{id: id, description: description}
  end

  # ensure todolist has not already been opened
  def execute(%TodoList{}, %CreateTodoList{}) do
    {:error, :todo_list_already_created}
  end

  # state mutators

  def apply(%TodoList{} = todo, %TodoListCreated{id: id, description: description}) do
    %TodoList{todo |
      id: id,
      description: description,
      items: [],
      completed: false
    }
  end
end
