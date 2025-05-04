defmodule TungSahurBot.Command.Newton do
  def handle_newton(content) do
    content |> valid_newton_command() |> get_newton_result()
  end

  defp valid_newton_command(content) do
    command =
      content
      |> String.downcase()
      |> String.split(" ")

    case command do
      ["!calc", value] -> {:ok, value}
      _ -> :error
    end
  end

  defp get_newton_result({:ok, value}) do
    {:ok, response} = HTTPoison.get("https://newton.vercel.app/api/v2/simplify/#{value}")
    {:ok, json} = JSON.decode(response.body)

    "Expression: #{json["expression"]} \nResult: #{json["result"]}"
  end

  defp get_newton_result(:error) do
    "Comando errado. Use: **!calc <expression>**"
  end
end
