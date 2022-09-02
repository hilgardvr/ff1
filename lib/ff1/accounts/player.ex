defmodule Ff1.Accounts.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :account_id, :integer
    field :driver1, :integer
    field :driver1_cost, :integer
    field :driver2, :integer
    field :driver2_cost, :integer
    field :driver3, :integer
    field :driver3_cost, :integer
    field :driver4, :integer
    field :driver4_cost, :integer
    field :driver5, :integer
    field :driver5_cost, :integer
    field :team_name, :string
    field :team_principle, :string

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:account_id, :team_name, :team_principle, :driver1, :driver1_cost, :driver2, :driver2_cost, :driver3, :driver3_cost, :driver4, :driver4_cost, :driver5, :driver5_cost])
    |> validate_required([:account_id, :team_name, :team_principle, :driver1, :driver1_cost, :driver2, :driver2_cost, :driver3, :driver3_cost, :driver4, :driver4_cost, :driver5, :driver5_cost])
  end

  def get_player_by_id(id) do
     Repo.get(FF1.Player, id)
  end

end
