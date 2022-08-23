defmodule Ff1.Repo.Migrations.CreateDrivers do
  use Ecto.Migration

  def change do
    create table("drivers") do
      add :driver_name,       :string, size: 256
      add :driver_short_code, :string, size: 3
      add :nationality,       :string, size: 3
      add :team, references(:teams)
    end
  end
end
