defmodule PhxBenchApi.TodoView do
  use PhxBenchApi.Web, :view

  attributes [:description,:complete]

  # def render("index.json-api", %{todos: todos}) do
  #   %{data: render_many(todos, PhxBenchApi.TodoView, "todo.json-api")}
  # end

  # def render("show.json-api", %{todo: todo}) do
  #   %{data: render_one(todo, PhxBenchApi.TodoView, "todo.json-api")}
  # end

  # def render("todo.json-api", %{todo: todo}) do
  #   %{id: todo.id,
  #     description: todo.description,
  #     complete: todo.complete}
  # end
end
