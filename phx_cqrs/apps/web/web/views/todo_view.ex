defmodule PhxCqrs.Web.TodoView do
  use PhxCqrs.Web.Web, :view

  def render("index.json", %{todo: todo}) do
    %{data: render_many(todo, PhxCqrs.Web.TodoView, "todo.json")}
  end

  def render("show.json", %{todo: todo}) do
    %{data: render_one(todo, PhxCqrs.Web.TodoView, "todo.json")}
  end

  def render("todo.json", %{todo: todo}) do
    %{id: todo.id, description: todo.description, completed: todo.completed}
  end
end
