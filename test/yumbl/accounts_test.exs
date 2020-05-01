defmodule Yumbl.AccountTest do
  use Yumbl.DataCase, async: true

  alias Yumbl.Accounts
  alias Yumbl.Accounts.User

  describe "register_user/1" do
    @valid_attrs %{
      name: "Joe",
      username: "joey",
      password: "password"
    }
    @invalid_attrs %{}

    test "with valid data insert user" do
      assert {:ok, %User{id: id} = user} = Accounts.register_user(@valid_attrs)
      assert user.name == "Joe"
      assert user.username == "joey"
      assert [%User{id: ^id}] = Accounts.list_users()
    end

    test "with invalid data does not insert user" do
      assert {:error, _changeset} = Accounts.register_user(@invalid_attrs)
      assert Accounts.list_users() == []
    end
  end

  describe "authenticate_by_password/2" do
    @pw "123456"

    setup do
      {:ok, user: user_fixture(password: @pw)}
    end

    test "return user with correct password", %{user: user} do
      assert {:ok, auth_user} = Accounts.authenticate_using_password(user.username, @pw)

      assert auth_user.id == user.id
    end

    test "return error with incorrect password", %{user: user} do
      assert {:error, :unauthorized} = Accounts.authenticate_using_password(user.username, "wrong")
    end
  end
end
