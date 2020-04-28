defmodule YumblWeb.UserView do
  use YumblWeb, :view

  alias Yumbl.Accounts

  def first_name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
