defmodule DataRestElixir.BooksTest do
  use DataRestElixir.DataCase

  alias DataRestElixir.Books

  describe "book" do
    alias DataRestElixir.Books.Book

    @valid_attrs %{genre: "some genre", name: "some name"}
    @update_attrs %{genre: "some updated genre", name: "some updated name"}
    @invalid_attrs %{genre: nil, name: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Books.create_book()

      book
    end

    test "list_book/0 returns all book" do
      book = book_fixture()
      assert Books.list_book() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Books.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Books.create_book(@valid_attrs)
      assert book.genre == "some genre"
      assert book.name == "some name"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, %Book{} = book} = Books.update_book(book, @update_attrs)
      assert book.genre == "some updated genre"
      assert book.name == "some updated name"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_book(book, @invalid_attrs)
      assert book == Books.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Books.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Books.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Books.change_book(book)
    end
  end
end
