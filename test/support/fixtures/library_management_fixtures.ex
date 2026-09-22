defmodule LiveviewWorkshop.LibraryManagementFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveviewWorkshop.LibraryManagement` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        author: "some author",
        title: "some title"
      })
      |> LiveviewWorkshop.LibraryManagement.create_book()

    book
  end
end
