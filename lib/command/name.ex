defmodule TungSahurBot.Command.Name do
    def handle_name(content) do
      content |> valid_name_command() |> get_name_result()
    end

    defp valid_name_command(content) do
      command =
        content
        |> String.downcase()
        |> String.split(" ")

      case command do
        ["!name", value] -> {:ok, value}
        _ -> :error
      end
    end

    defp get_name_result({:ok, value}) do
      {:ok, response} = HTTPoison.get("https://api.agify.io/?name=#{value}")
      {:ok, json} = JSON.decode(response.body)

      "Name: #{String.capitalize(json["name"])} \nEstimated age: #{json["age"]}"
    end

    defp get_name_result(:error) do
      "Comando errado. Use: **!name <name>**"
    end
  end
