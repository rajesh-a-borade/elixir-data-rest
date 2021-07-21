defmodule DataRestElixir.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "book" do
    field :genre, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:name, :genre])
    #|> validate_required([:name, :genre])
  end
end
