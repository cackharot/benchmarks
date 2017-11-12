defmodule PhxCqrs.InfrastructureTest do
  use ExUnit.Case
  doctest PhxCqrs.Infrastructure

  test "greets the world" do
    assert PhxCqrs.Infrastructure.hello() == :world
  end
end
