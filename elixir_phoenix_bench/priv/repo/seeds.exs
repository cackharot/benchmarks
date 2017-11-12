# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhxBenchApi.Repo.insert!(%PhxBenchApi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will halt execution if something goes wrong.
alias PhxBenchApi.Repo
alias PhxBenchApi.Todo

[
    %Todo{
        description: "Item 1",
        complete: false
    },
    %Todo{
        description: "Item 2",
        complete: false
    },
    %Todo{
        description: "Item 3",
        complete: true
    }
] |> Enum.each(&Repo.insert!(&1))

