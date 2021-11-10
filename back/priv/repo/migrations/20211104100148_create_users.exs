defmodule Back.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :password, :string
      add :role, :integer
      add :firstname, :string, null: true
      add :lastname, :string, null: true
      add :team, references(:teams, on_delete: :nothing)
      add :clock, references(:clocks, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:users, [:email])
    create index(:users, [:team])
    create index(:users, [:clock])
  end
end
