defmodule PhxCqrs.Projectors.TodoList do
    use Commanded.Projections.Ecto,
        name: "Projectors.TodoList",
        consistency: :strong

    alias PhxCqrs.Events.{
        TodoListCreated,
        TodoItemAdded,
        TodoItemCompleted,
    }
    alias PhxCqrs.Projections.TodoListProjection

    project %TodoListCreated{} = created do
        Ecto.Multi.insert(multi, :phxcqrs_todos, %TodoListProjection{
            id: created.id,
            description: created.description,
            completed: false,
        })
    end

    project %TodoItemCompleted{id: id} do
        update_todolist(multi, id, completed: true)
    end

    defp update_todolist(multi, id, changes) do
        Ecto.Multi.update_all(multi, :phxcqrs_todos, get_by_id(id), set: changes)
    end

    defp get_by_id(id) do
        from(u in TodoListProjection, where: u.id == ^id)
    end
end
