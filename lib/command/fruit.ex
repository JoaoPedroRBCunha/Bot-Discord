defmodule TungSahurBot.Command.Fruit do
  def handle_fruit(content) do
    content |> valid_fruit_command() |> get_fruit_result()
  end

  defp valid_fruit_command(content) do
    command =
      content
      |> String.downcase()
      |> String.split(" ")

    case command do
      ["!fruit", value] -> {:ok, value}
      _ -> :error
    end
  end

  defp get_fruit_result({:ok, value}) do
    {:ok, response} = HTTPoison.get("https://www.fruityvice.com/api/fruit/#{value}")
    {:ok, fruit} = JSON.decode(response.body)

    nutritions = fruit["nutritions"]

    "Fruit: #{fruit["name"]} \nFamily: #{fruit["family"]} \nNutritions: \n- Calories- #{nutritions["calories"]} \n- Fat- #{nutritions["fat"]} \n- Sugar- #{nutritions["sugar"]} \n- Carbohydrate- #{nutritions["carbohydrates"]} \n- Protein- #{nutritions["protein"]}"
  end

  defp get_fruit_result(:error) do
    "Comando errado. Use: **!fruit <fruit>**"
  end
end
