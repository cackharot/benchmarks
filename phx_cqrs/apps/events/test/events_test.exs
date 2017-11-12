defmodule PhxCqrs.EventsTest do
  use ExUnit.Case
  doctest PhxCqrs.Events

  test "greets the world" do
    assert PhxCqrs.Events.hello() == :world
  end
end
