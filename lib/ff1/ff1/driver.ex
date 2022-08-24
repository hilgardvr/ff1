defmodule Ff1.Ff1.Driver do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drivers" do
    field :driver_name, :string
    field :driver_short_code, :string
    field :nationality, :string
    field :driver_price, :integer
    field :team, :id

    timestamps()
  end

  @doc false
  def changeset(driver, attrs) do
    driver
    |> cast(attrs, [:driver_name, :driver_short_code, :nationality])
    |> validate_required([:driver_name, :driver_short_code, :nationality])
  end
end
