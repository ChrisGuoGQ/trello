defmodule Mytrello.Repo.Migrations.CreateMytrello.Accounts.User do
  use Ecto.Migration

  def change do
    create table(:accounts_users) do
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :email, :string, null: false
      add :encrypted_password, :string, null: false

      timestamps()
    end
    create unique_index(:accounts_users, [:email])
  end
end
