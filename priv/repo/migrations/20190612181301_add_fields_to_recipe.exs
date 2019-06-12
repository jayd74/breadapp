defmodule Breadapp.Repo.Migrations.AddFieldsToRecipe do
  use Ecto.Migration

  def change do
    alter table(:recipes) do
      add :ingredients, :string
      add :instructions, :string
    end
  end
end
