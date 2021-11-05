defmodule Back.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :password, :string
      add :role, :integer
      add :firstname, :string
      add :lastname, :string
      add :team, references(:teams, on_delete: :nothing)
      add :clock, references(:clocks, on_delete: :nothing)

      timestamps()
    end

    create index(:users, [:team])
    create index(:users, [:clock])
  end
end
