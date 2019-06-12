defmodule Breadapp.RecipeController do
  use Breadapp.Web, :controller

  alias Breadapp.Recipe

  def index(conn, _params) do
    recipes = Repo.all(Recipe)
    render conn, "index.html", recipes: recipes
  end

  def new(conn, _params) do
    changeset = Recipe.changeset(%Recipe{}, %{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"recipe" => recipe}) do
    changeset = Recipe.changeset(%Recipe{}, recipe)

    case Repo.insert(changeset) do
      {:ok, _recipe} ->
        conn
        |> put_flash(:info, "Recipe Added")
        |> redirect(to: recipe_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end

  def edit(conn, %{"id" => recipe_id}) do
    recipe = Repo.get(Recipe, recipe_id)
    changeset = Recipe.changeset(recipe)

    render conn, "edit.html", changeset: changeset, recipe: recipe
  end

  def update(conn, %{"id" => recipe_id, "recipe" => recipe}) do
    old_recipe = Repo.get(Recipe, recipe_id)
    changeset = Recipe.changeset(old_recipe, recipe)

    case Repo.update(changeset) do
      {:ok, _recipe} ->
        conn
        |> put_flash(:info, "Recipe Updated")
        |> redirect(to: recipe_path(conn, :index))
      {:error, changeset} ->
        render conn, "edit.html", changeset: changeset, recipe: old_recipe
    end
  end

  def delete(conn, %{"id" => recipe_id}) do
    Repo.get!(Recipe, recipe_id) |> Repo.delete!

    conn
    |> put_flash(:info, "Recipe Delete")
    |> redirect(to: recipe_path(conn, :index))
  end
end
