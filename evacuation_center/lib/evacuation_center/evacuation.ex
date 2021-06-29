defmodule EvacuationCenter.Evacuation do
  @moduledoc """
  The Evacuation context.
  """

  import Ecto.Query, warn: false
  alias EvacuationCenter.Repo

  alias EvacuationCenter.Evacuation.Center

  @doc """
  Returns the list of centers.

  ## Examples

      iex> list_centers()
      [%Center{}, ...]

  """
  def list_centers do
    Repo.all(Center)
  end

  @doc """
  Gets a single center.

  Raises `Ecto.NoResultsError` if the Center does not exist.

  ## Examples

      iex> get_center!(123)
      %Center{}

      iex> get_center!(456)
      ** (Ecto.NoResultsError)

  """
  def get_center!(id), do: Repo.get!(Center, id)

  @doc """
  Creates a center.

  ## Examples

      iex> create_center(%{field: value})
      {:ok, %Center{}}

      iex> create_center(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_center(attrs \\ %{}) do
    %Center{}
    |> Center.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a center.

  ## Examples

      iex> update_center(center, %{field: new_value})
      {:ok, %Center{}}

      iex> update_center(center, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_center(%Center{} = center, attrs) do
    center
    |> Center.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a center.

  ## Examples

      iex> delete_center(center)
      {:ok, %Center{}}

      iex> delete_center(center)
      {:error, %Ecto.Changeset{}}

  """
  def delete_center(%Center{} = center) do
    Repo.delete(center)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking center changes.

  ## Examples

      iex> change_center(center)
      %Ecto.Changeset{data: %Center{}}

  """
  def change_center(%Center{} = center, attrs \\ %{}) do
    Center.changeset(center, attrs)
  end
end
