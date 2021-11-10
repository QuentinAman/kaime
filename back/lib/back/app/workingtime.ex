defmodule Back.App.Workingtime do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workingtimes" do
    field :end, :string
    field :start, :string
    field :user, :id
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(workingtime, attrs) do
    workingtime
    |> cast(attrs, [:start, :end, :user, :description])
    |> validate_required([:start, :end, :user])
  end
end
