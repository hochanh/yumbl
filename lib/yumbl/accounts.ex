defmodule Yumbl.Accounts do

  alias Yumbl.Accounts.User

  def list_users do
    [
      %User{id: 1, name: "David", username: "david"},
      %User{id: 2, name: "Tommy", username: "tom"},
      %User{id: 3, name: "Joe", username: "joe"},
    ]
  end

  def get_user(id) do
    Enum.find(list_users(), fn map -> map.id == id end)
  end

  def get_user_by(params) do
    Enum.find(list_users(), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end)
  end
end
