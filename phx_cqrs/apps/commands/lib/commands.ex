defmodule PhxCqrs.Commands do
  @moduledoc """
  Documentation for PhxCqrs.Commands.
  """

  defmodule CreateTodoList do
    defstruct [:id, :description]

    use ExConstructor
    use Vex.Struct

    def assign_uuid(%CreateTodoList{} = model, uuid) do
      %CreateTodoList{model | id: uuid}
    end
  end

  defmodule AddTodoItem do
    defstruct [:title, :description, :completed]
  end

  defmodule DeleteTodoItem do
    defstruct [:id]
  end

  defmodule CompleteTodoItem do
    defstruct [:id]
  end

  defmodule UpdateTodoItem do
    defstruct [:id, :title, :description]
  end
end
