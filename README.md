# TungSahurBot

![Elixir](https://img.shields.io/badge/Elixir-4B275F?style=for-the-badge&logo=elixir&logoColor=white)
![Discord](https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white)

**Discord bot that uses commands in the chat for response your requests, throught of 7 apis**

## Run
```
iex -S mix (Running on the pc)
```
```
docker-compose up --build (Running with docker)
```

## Commands

| Command        | Description | Example usage | API used |
|:---------------|:------------|:-------------- |:----------------|
| `!weather <city>` | A RESTful free API to check the weather | `!weather Fortaleza` | [WeatherAPI](https://www.weatherapi.com/) |
| `!digimon <digimon>` | Provides information about digimon creatures | `!digimon betamon` | [Digimon Information](https://digimon-api.vercel.app/) |
| `!got <character_name>` | Some Game of Thrones quotes | `!got Jon` | [Game of Thrones Quotes](https://gameofthronesquotes.xyz/) | 
| `!cat <status_code>` | Cat for every HTTP Status | `!cat 200` | [HTTP Cat](https://http.cat/) |
| `!fruit <fruit>` | Data about all kinds of fruit | `!fruit orange` | [Fruityvice](https://www.fruityvice.com/#1) |
| `!name <name>` | Estimates the age from a first name | `!name João` | [Agify.io]{https://agify.io/} |
| `!number <number>` | Facts about numbers | `!number 2` | [Numbers]{http://numbersapi.com/#42} |
| `!calc <expression>` | Symbolic and Arithmetic Math Calculator | `!calc 2^2+2(2)` | [Newton]{https://newton.vercel.app/} |

## Dependences

```
mix deps.get (Download dependences)
```

```elixir
def deps do
  [
    {:nostrum, "~> 0.10"},
    {:dotenvy, "~> 0.8.0"},
    {:httpoison, "~> 2.0"}
  ]
end
```



