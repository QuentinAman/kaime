defmodule Back.Repo.Migrations.CreateClocks do
  use Ecto.Migration

  def change do
    create table(:clocks) do
      add :time, :string, null: true
      add :status, :boolean, default: false, null: false

      timestamps()
    end
  end
end
