defmodule Ff1.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :team_name, :string

      timestamps()
    end
  end
end
