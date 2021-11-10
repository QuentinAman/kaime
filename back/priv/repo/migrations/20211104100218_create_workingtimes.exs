defmodule Back.Repo.Migrations.CreateWorkingtimes do
  use Ecto.Migration

  def change do
    create table(:workingtimes) do
      add :start, :start
      add :end, :start
      add :user, references(:users, on_delete: :nothing)
      add :description, :string, null: true

      timestamps()
    end

    create index(:workingtimes, [:user])
  end
end
