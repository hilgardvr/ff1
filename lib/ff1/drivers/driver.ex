defmodule Ff1.Drivers.Driver do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drivers" do
    field :driver_name, :string
    field :driver_price, :integer
    field :team, :integer

    timestamps()
  end

  @doc false
  def changeset(driver, attrs) do
    driver
    |> cast(attrs, [:driver_name, :driver_price, :team])
    |> validate_required([:driver_name, :driver_price, :team])
  end
end
