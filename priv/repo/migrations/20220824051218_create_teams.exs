defmodule Ff1.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  #mix phx.gen.schema Ff1.Team teams team_name:string
  def change do
    create table(:teams) do
      add :team_name, :string, size: 256

      timestamps()
    end
  end
end
