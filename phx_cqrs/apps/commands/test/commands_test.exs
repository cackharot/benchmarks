defmodule PhxCqrs.CommandsTest do
  use ExUnit.Case
  doctest PhxCqrs.Commands

  test "greets the world" do
    assert PhxCqrs.Commands.hello() == :world
  end
end
