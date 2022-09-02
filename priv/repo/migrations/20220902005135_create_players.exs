defmodule Ff1.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :account_id, :integer
      add :team_name, :string
      add :team_principle, :string
      add :driver1, :integer
      add :driver1_cost, :integer
      add :driver2, :integer
      add :driver2_cost, :integer
      add :driver3, :integer
      add :driver3_cost, :integer
      add :driver4, :integer
      add :driver4_cost, :integer
      add :driver5, :integer
      add :driver5_cost, :integer

      timestamps()
    end
    #setupDummy()
  end

  #defp setupDummy() do
  #  execute("""
  #    insert into players (account_id, team_name, team_principle, driver1, driver1_cost, driver2, driver2_cost, driver3, driver3_cost, driver4, driver4_cost, driver5, driver5_cost) 
  #    values (
  #  """)
  #end
end
