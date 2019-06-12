defmodule Breadapp.Recipe do
  use Breadapp.Web, :model

  schema "recipes" do
    field :title, :string
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
