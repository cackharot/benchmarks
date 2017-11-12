defmodule PhxCqrs.Events do
  @moduledoc """
  Documentation for PhxCqrs.Events.
  """

  @doc """
  Hello world.

  ## Examples

      iex> PhxCqrs.Events.hello
      :world

  """
  def hello do
    :world
  end

  defmodule TodoListCreated do
    defstruct [:id, :description]
  end

  defmodule TodoItemAdded do
    defstruct [:id, :title, :description, :completed]
  end

  defmodule TodoItemCompleted do
    defstruct [:id]
  end
end
