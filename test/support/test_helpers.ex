defmodule Yumbl.TestHelpers do
  alias Yumbl.{Accounts, Multimedia}

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "An user",
        username: "user#{System.unique_integer([:positive])}",
        password: attrs[:password] || "bigsecret"
      })
      |> Accounts.register_user()

    user
  end

  def video_fixture(%Accounts.User{} = user, attrs \\ %{}) do
    attrs
    |> Enum.into(%{
      title: "The title",
      url: "http://youtube.com",
      description: "Desc"
    })

    {:ok, video} = Multimedia.create_video(user, attrs)

    video
  end
end
