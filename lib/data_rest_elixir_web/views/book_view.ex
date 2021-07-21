defmodule DataRestElixirWeb.BookView do
  use DataRestElixirWeb, :view
  alias DataRestElixirWeb.BookView

  def render("index.json", %{book: book}) do
    %{data: render_many(book, BookView, "book.json")}
  end

  def render("show.json", %{book: book}) do
    %{data: render_one(book, BookView, "book.json")}
  end

  def render("book.json", %{book: book}) do
    %{id: book.id,
      name: book.name,
      genre: book.genre}
  end
end
