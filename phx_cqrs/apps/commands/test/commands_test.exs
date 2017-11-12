defmodule PhxCqrs.CommandsTest do
  use ExUnit.Case
  doctest PhxCqrs.Commands

  test "create command object" do
    assert %PhxCqrs.Commands.CreateTodoList{id: 123, description: "test"} != nil
  end
end
