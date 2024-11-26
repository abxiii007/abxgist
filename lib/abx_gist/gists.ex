defmodule AbxGist.Gists do
  @moduledoc """
  The Gists context.
  """

  import Ecto.Query, warn: false
  alias AbxGist.Accounts.User
  alias AbxGist.Repo

  alias AbxGist.Gists.Gist

  @doc """
  Returns the list of gists.

  ## Examples

      iex> list_gists()
      [%Gist{}, ...]

  """
  def list_gists do
    Repo.all(Gist)
  end

  @doc """
  Gets a single gist.

  Raises `Ecto.NoResultsError` if the Gist does not exist.

  ## Examples

      iex> get_gist!(123)
      %Gist{}

      iex> get_gist!(456)
      ** (Ecto.NoResultsError)

  """
  def get_gist!(id), do: Repo.get!(Gist, id)

  @doc """
  Creates a gist.

  ## Examples

      iex> create_gist(%{field: value})
      {:ok, %Gist{}}

      iex> create_gist(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_gist(user, attrs \\ %{}) do
    user
    |>Ecto.build_assoc(:gists)
    |> Gist.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a gist.

  ## Examples

      iex> update_gist(gist, %{field: new_value})
      {:ok, %Gist{}}

      iex> update_gist(gist, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_gist(%Gist{} = gist, attrs) do
    gist
    |> Gist.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a gist.

  ## Examples

      iex> delete_gist(gist)
      {:ok, %Gist{}}

      iex> delete_gist(gist)
      {:error, %Ecto.Changeset{}}

  """
  def delete_gist(%User{} = user, gist_id) do
    gist = Repo.get!(Gist, gist_id)

    if user.id == gist.user_id do
      Repo.delete(gist)
      {:ok, gist}
    else
      {:error, :unauthorized}
    end
  end
  @doc """
  Returns an `%Ecto.Changeset{}` for tracking gist changes.

  ## Examples

      iex> change_gist(gist)
      %Ecto.Changeset{data: %Gist{}}

  """
  def change_gist(%Gist{} = gist, attrs \\ %{}) do
    Gist.changeset(gist, attrs)
  end

  alias AbxGist.Gists.SaveedGist

  @doc """
  Returns the list of saved_gists.

  ## Examples

      iex> list_saved_gists()
      [%SaveedGist{}, ...]

  """
  def list_saved_gists do
    Repo.all(SaveedGist)
  end

  @doc """
  Gets a single saveed_gist.

  Raises `Ecto.NoResultsError` if the Saveed gist does not exist.

  ## Examples

      iex> get_saveed_gist!(123)
      %SaveedGist{}

      iex> get_saveed_gist!(456)
      ** (Ecto.NoResultsError)

  """
  def get_saveed_gist!(id), do: Repo.get!(SaveedGist, id)

  @doc """
  Creates a saveed_gist.

  ## Examples

      iex> create_saveed_gist(%{field: value})
      {:ok, %SaveedGist{}}

      iex> create_saveed_gist(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_saveed_gist(user, attrs \\ %{}) do
    user 
    |> Ecto.build_assoc(:saved_gists)
    |> SaveedGist.changeset(attrs)
    |> Repo.insert()
  end

  @doc """ 
  Updates a saveed_gist.

  ## Examples

      iex> update_saveed_gist(saveed_gist, %{field: new_value})
      {:ok, %SaveedGist{}}

      iex> update_saveed_gist(saveed_gist, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_saveed_gist(%SaveedGist{} = saveed_gist, attrs) do
    saveed_gist
    |> SaveedGist.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a saveed_gist.

  ## Examples

      iex> delete_saveed_gist(saveed_gist)
      {:ok, %SaveedGist{}}

      iex> delete_saveed_gist(saveed_gist)
      {:error, %Ecto.Changeset{}}

  """
  def delete_saveed_gist(%SaveedGist{} = saveed_gist) do
    Repo.delete(saveed_gist)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking saveed_gist changes.

  ## Examples

      iex> change_saveed_gist(saveed_gist)
      %Ecto.Changeset{data: %SaveedGist{}}

  """
  def change_saveed_gist(%SaveedGist{} = saveed_gist, attrs \\ %{}) do
    SaveedGist.changeset(saveed_gist, attrs)
  end
end
