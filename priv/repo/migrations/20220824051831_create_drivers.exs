defmodule Ff1.Repo.Migrations.CreateDrivers do
  use Ecto.Migration

  #mix phx.gen.schema Ff1.Driver drivers driver_name:string driver_short_code:string nationality:string team:references:teams
  def change do
    create table(:drivers) do
      add :driver_name, :string
      add :driver_short_code, :string
      add :nationality, :string
      add :team, references(:teams, on_delete: :nothing)

      timestamps()
    end

    create index(:drivers, [:team])
  end
end
