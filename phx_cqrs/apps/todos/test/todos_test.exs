defmodule PhxCqrs.TodosTest do
  use ExUnit.Case
  doctest PhxCqrs.Todo

  alias PhxCqrs.Commands.{CreateTodoList,AddTodoItem,CompleteTodoItem}
  alias PhxCqrs.Events.{TodoListCreated,TodoItemAdded,TodoItemCompleted}
  alias PhxCqrs.Todo
  alias PhxCqrs.Projections.TodoListProjection

  test "create a new todo list" do
    { ok, %TodoListProjection{} = tl } = Todo.create_todolist(%{description: "somedesc"})
    assert ok == :ok
    assert tl.description == "somedesc"
  end
end
