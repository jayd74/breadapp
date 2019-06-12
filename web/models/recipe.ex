defmodule Breadapp.Recipe do
  use Breadapp.Web, :model

  schema "recipes" do
    field :title, :string
    field :ingredients, :string
    field :instructions, :string
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :instructions, :ingredients])
    |> validate_required([:title, :instructions, :ingredients])
  end

end
