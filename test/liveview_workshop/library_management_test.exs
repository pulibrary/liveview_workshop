defmodule LiveviewWorkshop.LibraryManagementTest do
  use LiveviewWorkshop.DataCase

  alias LiveviewWorkshop.LibraryManagement

  describe "books" do
    alias LiveviewWorkshop.LibraryManagement.Book

    import LiveviewWorkshop.LibraryManagementFixtures

    @invalid_attrs %{title: nil, author: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert LibraryManagement.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert LibraryManagement.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{title: "some title", author: "some author"}

      assert {:ok, %Book{} = book} = LibraryManagement.create_book(valid_attrs)
      assert book.title == "some title"
      assert book.author == "some author"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LibraryManagement.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{title: "some updated title", author: "some updated author"}

      assert {:ok, %Book{} = book} = LibraryManagement.update_book(book, update_attrs)
      assert book.title == "some updated title"
      assert book.author == "some updated author"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = LibraryManagement.update_book(book, @invalid_attrs)
      assert book == LibraryManagement.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = LibraryManagement.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> LibraryManagement.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = LibraryManagement.change_book(book)
    end
  end
end
