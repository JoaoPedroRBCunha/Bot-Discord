defmodule TungSahurBot.Command.Weather do
  def handle_weather(content) do
    content |> valid_city_command() |> get_weather_result()
  end

  defp valid_city_command(content) do
    command =
      content
      |> String.downcase()
      |> String.split(" ", parts: 2)

    case command do
      ["!weather", value] -> {:ok, value}
      _ -> :error
    end
  end

  defp get_weather_result({:ok, value}) do
    {:ok, response} = HTTPoison.get("https://goweather.xyz/weather/#{value}")
    {:ok, json} = JSON.decode(response.body)

    city_formatted =
      value
      |> String.split(" ")
      |> Enum.map(&String.capitalize/1)
      |> Enum.join(" ")

    "Informations about weather in #{city_formatted}: \n- Temperature: #{json["temperature"]} \n- Wind: #{json["wind"]} \n- Description: #{json["description"]}"
  end

  defp get_weather_result(:error) do
    "Comando errado. Use: **!weather <cidade>**"
  end
end
