defmodule Breadapp.Repo.Migrations.AddRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string
    end
  end
end
