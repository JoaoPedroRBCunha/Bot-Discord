defmodule TungSahurBot.Command.Cat do
  def handle_cat(content) do
    content |> valid_cat_command() |> get_cat_result()
  end

  defp valid_cat_command(content) do
    command =
      content
      |> String.downcase()
      |> String.split(" ")

    case command do
      ["!cat", value] -> {:ok, value}
      _ -> :error
    end
  end

  defp get_cat_result({:ok, value}) do
    url = "https://http.cat/#{value}"
    "Status code: #{value} \n#{url}"
  end

  defp get_cat_result(:error) do
    "Comando errado. Use: **!cat <status_code>**"
  end
end
