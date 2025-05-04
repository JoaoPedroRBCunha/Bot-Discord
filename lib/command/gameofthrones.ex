defmodule TungSahurBot.Command.GOT do
  def handle_got(content) do
    content |> valid_got_command() |> get_got_result()
  end

  defp valid_got_command(content) do
    command =
      content
      |> String.downcase()
      |> String.split(" ")

    case command do
      ["!got", value] -> {:ok, value}
      _ -> :error
    end
  end

  defp get_got_result({:ok, value}) do
    {:ok, response} = HTTPoison.get("https://api.gameofthronesquotes.xyz/v1/author/#{value}/1")
    {:ok, json} = JSON.decode(response.body)

    character = json["character"]
    house = character["house"]

    "#{character["name"]}: \n- Denomitation: #{character["slug"]} \n- Sentence: '#{json["sentence"]}' \n- Name of house: #{house["name"]}"
  end

  defp get_got_result(:error) do
    "Comando errado. Use: **!got <character_name>**"
  end
end
