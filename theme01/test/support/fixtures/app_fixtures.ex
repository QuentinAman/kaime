defmodule Theme01.AppFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Theme01.App` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        username: "some username"
      })
      |> Theme01.App.create_user()

    user
  end

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~N[2021-10-25 07:56:00]
      })
      |> Theme01.App.create_clock()

    clock
  end

  @doc """
  Generate a workingtime.
  """
  def workingtime_fixture(attrs \\ %{}) do
    {:ok, workingtime} =
      attrs
      |> Enum.into(%{
        end: ~N[2021-10-25 07:59:00],
        start: ~N[2021-10-25 07:59:00]
      })
      |> Theme01.App.create_workingtime()

    workingtime
  end
end
