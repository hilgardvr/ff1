defmodule Ff1.Repo.Migrations.AddDrivers do
  use Ecto.Migration

  def change do
    Ff1.Repo.insert!(%Ff1.Ff1.Team{team_name: "Red Bull Racing RBPT" })
    Ff1.Repo.insert!(%Ff1.Ff1.Team{team_name: "Ferrari" })
    Ff1.Repo.insert!(%Ff1.Ff1.Team{team_name: "Mercedes" })
    Ff1.Repo.insert!(%Ff1.Ff1.Team{team_name: "Alpine Renault" })
    Ff1.Repo.insert!(%Ff1.Ff1.Team{team_name: "McLaren Mercedes" })
    Ff1.Repo.insert!(%Ff1.Ff1.Team{team_name: "Alfa Romeo Ferrari" })
    Ff1.Repo.insert!(%Ff1.Ff1.Team{team_name: "Haas Ferrari" })
    Ff1.Repo.insert!(%Ff1.Ff1.Team{team_name: "AlphaTauri RBPT" })
    Ff1.Repo.insert!(%Ff1.Ff1.Team{team_name: "Aston Martin Aramco Mercedes" })
    Ff1.Repo.insert!(%Ff1.Ff1.Team{team_name: "Williams Mercedes" })
  end
end
