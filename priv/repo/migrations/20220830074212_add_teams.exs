defmodule Ff1.Repo.Migrations.AddTeams do
  use Ecto.Migration

  def change do
    execute("""
      insert into teams (team_name, inserted_at, updated_at) 
      values 
        ('Red Bull Racing RBPT', now(), now()),
        ('Ferrari', now(), now()),
        ('Mercedes', now(), now()),
        ('Alpine Renault', now(), now()),
        ('McLaren Mercedes', now(), now()),
        ('Alfa Romeo Ferrari', now(), now()),
        ('Haas Ferrari', now(), now()),
        ('AlphaTauri RBPT', now(), now()),
        ('Aston Martin Aramco Mercedes', now(), now()),
        ('Williams Mercedes', now(), now());
    """)
  end
end
