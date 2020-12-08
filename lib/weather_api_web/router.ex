defmodule WeatherApiWeb.Router do
  use WeatherApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WeatherApiWeb do
    pipe_through :api
    get "/", DefaultController, :index
    post "/weather", WeatherController, :index
  end

end
