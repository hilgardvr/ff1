defmodule Ff1.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset
  import Ff1.Repo

  schema "accounts" do
    field :email, :string
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:email, :password_hash])
    |> validate_required([:email, :password_hash])
    |> validate_format(:email, ~r/@/)
    #|> validate_format(:password_hash, String.
  end

  def create_account(account) do
    changeset(%Ff1.Accounts.Account{}, account)
    |> Ff1.Repo.insert()
  end
end
