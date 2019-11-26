defmodule Breadapp.Schema.Types do
  use Absinthe.Schema.Notation

  object :recipe do
    field :title, :string
    field :ingredients, :string
    field :instructions, :string
  end

end
