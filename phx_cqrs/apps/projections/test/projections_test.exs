defmodule PhxCqrs.ProjectionsTest do
  use ExUnit.Case
  doctest PhxCqrs.Projections

  test "greets the world" do
    assert PhxCqrs.Projections.hello() == :world
  end
end
