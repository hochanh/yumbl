# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Yumbl.Repo.insert!(%Yumbl.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Yumbl.Multimedia

for category <- ~w(Action Drama Sci-fi Romance Comedy) do
  Multimedia.create_category!(category)
end
