defmodule Ff1.Repo.Migrations.AddDrivers do
  use Ecto.Migration

  def change do
    execute("""
      insert into drivers (driver_name, driver_price, team, inserted_at, updated_at) values 
        ('Max Verstappen', -1, (select id from teams where team_name = 'Red Bull Racing RBPT'),now(),now()),
        ('Charles Leclerc', -1, (select id from teams where team_name = 'Ferrari'),now(),now()),
        ('Sergio Perez', -1, (select id from teams where team_name = 'Red Bull Racing RBPT'),now(),now()),
        ('George Russell', -1, (select id from teams where team_name = 'Mercedes'),now(),now()),
        ('Carlos Sainz', -1, (select id from teams where team_name = 'Ferrari'),now(),now()),
        ('Lewis Hamilton', -1, (select id from teams where team_name = 'Mercedes'),now(),now()),
        ('Lando Norris', -1, (select id from teams where team_name = 'McLaren Mercedes'),now(),now()),
        ('Esteban Ocon', -1, (select id from teams where team_name = 'Alpine Renault'),now(),now()),
        ('Valtteri Bottas', -1, (select id from teams where team_name = 'Alfa Romeo Ferrari'),now(),now()),
        ('Fernando Alonso', -1, (select id from teams where team_name = 'Alpine Renault'),now(),now()),
        ('Kevin Magnussen', -1, (select id from teams where team_name = 'Haas Ferrari'),now(),now()),
        ('Daniel Ricciardo', -1, (select id from teams where team_name = 'McLaren Mercedes'),now(),now()),
        ('Pierre Gasly', -1, (select id from teams where team_name = 'AlphaTauri RBPT'),now(),now()),
        ('Sebastian Vettel', -1, (select id from teams where team_name = 'Aston Martin Aramco Mercedes'),now(),now()),
        ('Mick Schumacher', -1, (select id from teams where team_name = 'Haas Ferrari'),now(),now()),
        ('Yuki Tsunoda', -1, (select id from teams where team_name = 'AlphaTauri RBPT'),now(),now()),
        ('Zhou Guanyu', -1, (select id from teams where team_name = 'Alfa Romeo Ferrari'),now(),now()),
        ('Lance Stroll', -1, (select id from teams where team_name = 'Aston Martin Aramco Mercedes'),now(),now()),
        ('Alexander Albon', -1, (select id from teams where team_name = 'Williams Mercedes'),now(),now()),
        ('Nicholas Latifi', -1, (select id from teams where team_name = 'Williams Mercedes'),now(),now()),
        ('Nico Hulkenberg', -1, (select id from teams where team_name = 'Aston Martin Aramco Mercedes'),now(),now())
    """)
  end
end

#    execute("""
#      insert into drivers (driver_name, driver_short_code, nationality, team, inserted_at, updated_at) 
#      values 
#        ('Max Verstappen','','NED', (select id from teams where team_name = 'Red Bull Racing RBPT'),now(),now()),
#        ('Charles Leclerc','','MON', (select id from teams where team_name = 'Ferrari'),now(),now()),
#        ('Sergio Perez','','MEX', (select id from teams where team_name = 'Red Bull Racing RBPT'),now(),now()),
#        ('George Russell','','GBR', (select id from teams where team_name = 'Mercedes'),now(),now()),
#        ('Carlos Sainz','','ESP', (select id from teams where team_name = 'Ferrari'),now(),now()),
#        ('Lewis Hamilton','','GBR', (select id from teams where team_name = 'Mercedes'),now(),now()),
#        ('Lando Norris','','GBR', (select id from teams where team_name = 'McLaren Mercedes'),now(),now()),
#        ('Esteban Ocon','','FRA', (select id from teams where team_name = 'Alpine Renault'),now(),now()),
#        ('Valtteri Bottas','','FIN', (select id from teams where team_name = 'Alfa Romeo Ferrari'),now(),now()),
#        ('Fernando Alonso','','ESP', (select id from teams where team_name = 'Alpine Renault'),now(),now()),
#        ('Kevin Magnussen','','DEN', (select id from teams where team_name = 'Haas Ferrari'),now(),now()),
#        ('Daniel Ricciardo','','AUS', (select id from teams where team_name = 'McLaren Mercedes'),now(),now()),
#        ('Pierre Gasly','','FRA', (select id from teams where team_name = 'AlphaTauri RBPT'),now(),now()),
#        ('Sebastian Vettel','','GER', (select id from teams where team_name = 'Aston Martin Aramco Mercedes'),now(),now()),
#        ('Mick Schumacher','','GER', (select id from teams where team_name = 'Haas Ferrari'),now(),now()),
#        ('Yuki Tsunoda','','JPN', (select id from teams where team_name = 'AlphaTauri RBPT'),now(),now()),
#        ('Zhou Guanyu','','CHN', (select id from teams where team_name = 'Alfa Romeo Ferrari'),now(),now()),
#        ('Lance Stroll','','CAN', (select id from teams where team_name = 'Aston Martin Aramco Mercedes'),now(),now()),
#        ('Alexander Albon','','THA', (select id from teams where team_name = 'Williams Mercedes'),now(),now()),
#        ('Nicholas Latifi','','CAN', (select id from teams where team_name = 'Williams Mercedes'),now(),now()),
#        ('Nico Hulkenberg','','GER', (select id from teams where team_name = 'Aston Martin Aramco Mercedes'),now(),now())
#    """)
