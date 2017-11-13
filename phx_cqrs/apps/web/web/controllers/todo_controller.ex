defmodule PhxCqrs.Web.TodoController do
  use PhxCqrs.Web.Web, :controller

  alias PhxCqrs.Todo
  alias PhxCqrs.Projections.TodoListProjection

  def index(conn, _params) do
    todo = Todo.all()
    render(conn, "index.json", todo: todo)
  end

  def create(conn, %{"todo" => todo_params}) do
    with {:ok, %TodoListProjection{} = todo} <- Todo.create_todolist(todo_params) do
      conn
      |> put_status(:created)
      |> render("show.json", todo: todo)
    end
  end

  def show(conn, %{"id" => id}) do
    todo = Todo.get(id)
    render(conn, "show.json", todo: todo)
  end
end
