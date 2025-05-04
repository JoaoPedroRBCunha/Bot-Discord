defmodule TungSahurBot.Command.Digimon do
  def handle_digimon(content) do
    content |> valid_digimon_command() |> get_digimon_result()
  end

  defp valid_digimon_command(content) do
    command =
      content
      |> String.downcase()
      |> String.split(" ")

    case command do
      ["!digimon", value] -> {:ok, value}
      _ -> :error
    end
  end

  defp get_digimon_result({:ok, value}) do
    {:ok, response} = HTTPoison.get("https://digimon-api.vercel.app/api/digimon/name/#{value}")
    {:ok, [digimon | _]} = JSON.decode(response.body)

    "Digimon: #{digimon["name"]} \nLevel: #{digimon["level"]} \n#{digimon["img"]}"
  end

  defp get_digimon_result(:error) do
    "Comando errado. Use: **!digimon <digimon>**"
  end
end
