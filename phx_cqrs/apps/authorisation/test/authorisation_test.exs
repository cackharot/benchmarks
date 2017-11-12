defmodule PhxCqrs.AuthorisationTest do
  use ExUnit.Case
  doctest PhxCqrs.Authorisation

  test "greets the world" do
    assert PhxCqrs.Authorisation.hello() == :world
  end
end
