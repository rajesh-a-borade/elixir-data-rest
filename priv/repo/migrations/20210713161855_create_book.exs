defmodule DataRestElixir.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:book) do
      add :name, :string
      add :genre, :string

      timestamps()
    end

  end
end
