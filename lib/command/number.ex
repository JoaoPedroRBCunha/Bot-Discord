defmodule TungSahurBot.Command.Number do
  def handle_number(content) do
    content |> valid_number_command() |> get_number_result()
  end

  defp valid_number_command(content) do
    command =
      content
      |> String.downcase()
      |> String.split(" ")

    case command do
      ["!number", value] -> {:ok, value}
      _ -> :error
    end
  end

  defp get_number_result({:ok, value}) do
    {:ok, response} = HTTPoison.get("http://numbersapi.com/#{value}?json")
    {:ok, json} = JSON.decode(response.body)

    "Fact about number #{value}: \n#{json["text"]}"
  end

  defp get_number_result(:error) do
    "Comando errado. Use: **!number <number>**"
  end
end
