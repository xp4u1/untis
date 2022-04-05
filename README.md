<div align="center">
  <h1>Untis</h1>
</div>
<div align="center">
    <strong>📚 Unofficial Elixir wrapper for the Untis Mobile and WebUntis API 📐</strong>
</div>

<br/>

<div align="center">
    <a href="#">
        <img alt="version" style="height: 33px" src="https://img.shields.io/static/v1.svg?label=Version&message=1.0.0&color=389ad5&labelColor=31c4f3&style=for-the-badge" />
    </a>
    <a href="https://elixir-lang.org">
        <img alt="elixir" style="height: 33px" src="https://img.shields.io/static/v1.svg?label=Made with&message=Elixir&color=ae68cc&labelColor=6e4a7e&style=for-the-badge" />
    </a>
</div>

<div align="center">
    <h3>
        <a href="https://hex.pm/packages/untis">Package</a>
        <span> | </span>
        <a href="https://hexdocs.pm/untis">Documentation</a>
    </h3>
</div>


<br />

## Installation

The package can be installed
by adding `untis` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:untis, "~> 1.0.0"}
  ]
end
```

The documentation can be found at [https://hexdocs.pm/untis](https://hexdocs.pm/untis).

## Example

```elixir
# Most requests require a valid login.
Untis.Auth.JsonAuth.login("max.mustermann", "2W9ZNXI472JLVH63", "test-school")

today = Date.utc_today()

Untis.timetable_student(
  420,
  Date.beginning_of_week(today),
  Date.beginning_of_week(today)
  |> Date.add(5)
)
```

## Legal

I am not affiliated with Untis GmbH. Use this at your own risk.
