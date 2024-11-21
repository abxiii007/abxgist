defmodule AbxGist.Gists.SaveedGist do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "saved_gists" do

    field :user_id, :binary_id
    field :gist_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(saveed_gist, attrs) do
    saveed_gist
    |> cast(attrs, [])
    |> validate_required([])
  end
end