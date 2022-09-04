defmodule Ff1.Repo.Migrations.UpdateDriverPrices do
  use Ecto.Migration

  def change do
    execute("""
      update drivers as d
      set driver_price = n.price
      from (values
        (440262, 1),
        (338202, 2),
        (338202, 3),
        (326030, 4),
        (313858, 5),
        (297940, 6),
        (226779, 7),
        (211798, 8),
        (205243, 10),
        (193071, 9),
        (170599, 11),
        (168727, 14),
        (167790, 12),
        (166854, 13),
        (161236, 15),
        (160300, 16),
        (154682, 17),
        (154682, 18),
        (153745, 19),
        (150000, 20),
        (150000, 21)) as n(price, id)
      where d.id = n.id;
    """)
  end
end


# update drivers set driver_price = 440262 where id = 1;
# update drivers set driver_price = 338202 where id = 2;
# update drivers set driver_price = 338202 where id = 3;
# update drivers set driver_price = 326030 where id = 4;
# update drivers set driver_price = 313858 where id = 5;
# update drivers set driver_price = 297940 where id = 6;
# update drivers set driver_price = 226779 where id = 7;
# update drivers set driver_price = 211798 where id = 8;
# update drivers set driver_price = 205243 where id = 10;
# update drivers set driver_price = 193071 where id = 9;
# update drivers set driver_price = 170599 where id = 11;
# update drivers set driver_price = 168727 where id = 14;
# update drivers set driver_price = 167790 where id = 12;
# update drivers set driver_price = 166854 where id = 13;
# update drivers set driver_price = 161236 where id = 15;
# update drivers set driver_price = 160300 where id = 16;
# update drivers set driver_price = 154682 where id = 17;
# update drivers set driver_price = 154682 where id = 18;
# update drivers set driver_price = 153745 where id = 19;
# update drivers set driver_price = 150000 where id = 20;
# update drivers set driver_price = 150000 where id = 21;
