defmodule WeatherApiWeb.WeatherController do
  use WeatherApiWeb, :controller

  def index(conn, %{"city" => city}) do
    appid = get_req_header(conn, "appid")
    case HTTPoison.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{appid}") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body }} ->
        json(conn, body |> Poison.decode!)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end
end
