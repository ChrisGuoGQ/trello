defmodule Mytrello.Web.Router do
  use Mytrello.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Mytrello.Web do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
  end
end
