defmodule PhxCqrs.TodosTest do
  use ExUnit.Case
  doctest PhxCqrs.Todos

  alias PhxCqrs.Commands.{CreateTodoList,AddTodoItem,CompleteTodoItem}
  alias PhxCqrs.Events.{TodoListCreated,TodoItemAdded,TodoItemCompleted}
  alias PhxCqrs.Todos

  test "create a new todo list" do
    assert Todos.execute(%Todos{},%CreateTodoList{id: "123", description: "somedesc"}) == %TodoListCreated{id: "123", description: "somedesc"}
  end
end
