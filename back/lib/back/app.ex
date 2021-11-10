defmodule Back.App do
  import Ecto.Query, warn: false
  alias Back.Repo

  def generate_token(user) do
    signer = Joken.Signer.create("HS256", "kaimesecret")
    Back.Token.generate_and_sign(%{id: user.id, role: user.role}, signer)
  end

  def check_token(token) do
    signer = Joken.Signer.create("HS256", "kaimesecret")
    Back.Token.verify_and_validate(token, signer)
  end

  def check_password(password) do
    case password do
      "" -> {:error, "empty_password"}
      _ -> {:ok, password: password}
    end
  end

  alias Back.App.User

  def list_users do
    Repo.all(User)
  end

  def get_user!(id), do: Repo.get!(User, id)

  def create_user(attrs \\ %{}) do
    %{"password" => password} = attrs

    case check_password(password) do
      {:ok, _} ->
        case %User{}
             |> User.changeset(attrs, "create")
             |> Repo.insert() do
          {:ok, user} ->
            {:ok, %Back.App.Clock{} = clock} = create_clock()
            update_user(user, %{clock: clock.id})
            {:ok, user}

          {:error, changeset} ->
            errors = changeset.errors
            {error, _} = errors[:email]
            {:error, error}
        end

      {:error, message} ->
        {:error, message}
    end
  end

  def login(email, password) do
    query = from u in User, where: u.email == ^email
    user = Repo.one(query)

    if is_nil(user) do
      {:error, "user doesn't exists"}
    else
      with {:ok, %User{} = connectedUser} <-
             Bcrypt.check_pass(user, password, hash_key: :password) do
        with {:ok, token, _claims} <- generate_token(user) do
          {:ok, %{user: connectedUser, token: token}}
        end
      end
    end
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs, "update")
    |> Repo.update()
  end

  def update_password(%User{} = user, attrs) do
    user
    |> User.changeset(attrs, "password")
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    wt_query = from(w in Back.App.Workingtime, where: w.user == ^user.id)

    Ecto.Multi.new()
    |> Ecto.Multi.delete_all(:delete_all, wt_query)
    |> Back.Repo.transaction()

    Repo.delete(user)

    c_query = from(c in Back.App.Clock, where: c.id == ^user.clock)

    clock = Repo.one(c_query)

    Repo.delete(clock)

    {:ok, user}
  end

  alias Back.App.Workingtime

  def get_workingtime!(id) do
    Repo.get!(Workingtime, id)
  end

  def get_my_workingtimes(user_id) do
    query = from w in Workingtime, where: w.user == ^user_id
    Repo.all(query)
  end

  def create_workingtime(attrs \\ %{}) do
    %Workingtime{}
    |> Workingtime.changeset(attrs)
    |> Repo.insert()
  end

  def update_workingtime(%Workingtime{} = workingtime, attrs) do
    workingtime
    |> Workingtime.changeset(attrs)
    |> Repo.update()
  end

  def delete_workingtime(%Workingtime{} = workingtime) do
    Repo.delete(workingtime)
  end

  alias Back.App.Clock

  def get_clock!(id), do: Repo.get!(Clock, id)

  def create_clock(attrs \\ %{}) do
    %Clock{}
    |> Clock.changeset(attrs)
    |> Repo.insert()
  end

  def update_clock(%Clock{} = clock, attrs) do
    clock
    |> Clock.changeset(attrs)
    |> Repo.update()
  end

  def delete_clock(%Clock{} = clock) do
    Repo.delete(clock)
  end

  def change_clock(%Clock{} = clock, attrs \\ %{}) do
    Clock.changeset(clock, attrs)
  end

  alias Back.App.Team

  def list_teams do
    Repo.all(Team)
  end

  def get_team!(id), do: Repo.get!(Team, id)

  def create_team(attrs \\ %{}) do
    %Team{}
    |> Team.changeset(attrs)
    |> Repo.insert()
  end

  def update_team(%Team{} = team, attrs) do
    team
    |> Team.changeset(attrs)
    |> Repo.update()
  end

  def delete_team(%Team{} = team) do
    Repo.delete(team)
  end
end
