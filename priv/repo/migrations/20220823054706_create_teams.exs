defmodule Ff1.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table("teams") do
      add :team_name, :string, size: 256
    end
  end
end
