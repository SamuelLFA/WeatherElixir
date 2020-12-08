defmodule WeatherApiWeb.DefaultController do
  use WeatherApiWeb, :controller

  def index(conn, _params) do
    text conn, "WeatherApi!"
  end
end
