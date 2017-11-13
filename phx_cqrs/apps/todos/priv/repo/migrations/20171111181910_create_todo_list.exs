defmodule PhxCqrs.Todos.Repo.Migrations.CreateTodoListProjection do
  use Ecto.Migration

  def change do
    create table(:todo_list_projection, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :description, :string
      add :completed, :boolean, default: false

      timestamps()
    end

    # create unique_index(:todo_list_projection, [:username])
    # create unique_index(:accounts_users, [:email])
  end
end
