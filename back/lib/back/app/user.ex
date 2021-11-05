defmodule Back.App.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :firstname, :string
    field :lastname, :string
    field :password, :string
    field :role, :integer, default: 0
    field :team, :id
    field :clock, :id

    timestamps()
  end

  @doc false
  def changeset(user, attrs, "create") do
    user
    |> cast(attrs, [:email, :password, :role, :firstname, :lastname, :clock])
    |> validate_required([:email, :password, :role])
    |> unique_constraint(:email)
    |> hash_password()
  end

  def changeset(user, attrs, "update") do
    user
    |> cast(attrs, [:email, :password, :role, :firstname, :lastname, :clock])
    |> validate_required([:email, :password, :role])
    |> unique_constraint(:email)
  end

  @spec hash_password(Ecto.Changeset.t()) :: Ecto.Changeset.t()
  def hash_password(changeset) do
    password = get_field(changeset, :password)

    put_change(
      changeset,
      :password,
      Bcrypt.Base.hash_password(
        password,
        Bcrypt.gen_salt(12)
      )
    )
  end
end
