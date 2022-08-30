defmodule Ff1.Repo.Migrations.CreateDrivers do
  use Ecto.Migration

  def change do
    create table(:drivers) do
      add :driver_name, :string
      add :driver_price, :integer
      add :team, :integer

      timestamps()
    end
  end
end
