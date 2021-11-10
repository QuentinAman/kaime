defmodule Back.Repo.Migrations.CreateWorkingtimes do
  use Ecto.Migration

  def change do
    create table(:workingtimes) do
      add(:start, :string)
      add(:end, :string)
      add(:user, references(:users, on_delete: :nothing))
      add(:description, :string, null: true)

      timestamps()
    end

    create(index(:workingtimes, [:user]))
  end
end
