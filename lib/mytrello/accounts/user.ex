defmodule Mytrello.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Mytrello.Accounts.User


  schema "accounts_users" do
    field :email, :string
    field :encrypted_password, :string
    field :first_name, :string
    field :last_name, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email], [:encrypted_password])
    |> validate_required([:first_name, :last_name, :email])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 5)
    |> validate_confirmation(:password, message: "password dose not match", required: true)
    |> unique_constraint(:email, message: "email already taken")
  end
end
