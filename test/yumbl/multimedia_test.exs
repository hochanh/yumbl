defmodule Yumbl.MultimediaTest do
  use Yumbl.DataCase, async: true

  alias Yumbl.Multimedia
  alias Yumbl.Multimedia.Category

  describe "categories" do
    test "list categories alphabetically/0" do
      for name <- ~w(Drama Action Comedy) do
        Multimedia.create_category!(name)
      end

      names = for %Category{name: name} <- Multimedia.list_categories_alphabetically(), do: name

      assert names == ~w(Action Comedy Drama)
    end
  end
end
