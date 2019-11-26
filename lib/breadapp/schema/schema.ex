defmodule Breadapp.Schema do

  use Absinthe.Schema

  import_types Breakapp.Schema.Types

  query "recipes" do
    field :title
    field :ingredients
    field :instructions
  end

end
