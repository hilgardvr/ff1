defmodule Ff1.Repo.Migrations.AddDriverPrice do
  use Ecto.Migration

  def change do
    alter table(:drivers) do
      add :driver_price, :integer
    end

  end
end
