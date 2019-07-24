defmodule Breadapp.Router do
  use Breadapp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Breadapp do
    pipe_through :browser # Use the default browser stack

    get "/", RecipeController, :index

    resources "/", RecipeController
  end

  scope "/auth", Breadapp do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", Breadapp do
  #   pipe_through :api
  # end
end
