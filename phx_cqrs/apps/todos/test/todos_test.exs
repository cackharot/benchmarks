defmodule PhxCqrs.TodosTest do
  use ExUnit.Case
  doctest PhxCqrs.Todos

  test "greets the world" do
    assert PhxCqrs.Todos.hello() == :world
  end
end
