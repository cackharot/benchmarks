defmodule PhxCqrs.Todos.Router do
    use Commanded.Commands.Router

    alias PhxCqrs.Commands.{CreateTodoList,AddTodoItem,CompleteTodoItem}
    alias PhxCqrs.Aggregates.TodoList

    identify TodoList, by: :id, prefix: "todolist-"

    dispatch [
        CreateTodoList,
        AddTodoItem,
        CompleteTodoItem
    ], to: TodoList

  end
