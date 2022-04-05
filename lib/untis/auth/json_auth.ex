defmodule Untis.Auth.JsonAuth do
  @moduledoc """
  Authentication module to use the API.
  """

  @doc false
  def start_link() do
    Agent.start_link(fn -> %{username: "", secret: "", schoolname: ""} end,
      name: __MODULE__
    )
  end

  @doc """
  Starts the JSON auth agent to use the Untis API.
  Use the information provided by <https://mese.webuntis.com/WebUntis/api/profile/access>
  or use the WebUntis to display the QR-code.
  """
  def login(username, secret, schoolname) do
    start_link()

    Agent.update(__MODULE__, fn _ ->
      %{username: username, secret: secret, schoolname: schoolname}
    end)
  end

  @doc """
  Returns the shared app secret of the given user.
  But you need the school-id, not the name (e.g. 2567800 for mcg-gehrden).
  """
  def shared_secret(username, password, school) do
    params = %{
      "userName" => username,
      "password" => password
    }

    data = %{
      "jsonrpc" => "2.0",
      "id" => "",
      "method" => "getAppSharedSecret",
      "params" => [params]
    }

    HTTPoison.post!(
      "https://mese.Untis.com/WebUntis/jsonrpc_intern.do?school=#{school}",
      Jason.encode!(data),
      [
        {"Content-Type", "application/json; charset=UTF-8"}
      ]
    ).body
    |> Jason.decode!()
    |> Map.fetch!("result")
  end

  @doc false
  def auth_map() do
    state = current_state()

    %{
      "user" => state.username,
      "otp" => Untis.Auth.Totp.generate_totp(state.secret),
      "clientTime" => :os.system_time(:millisecond)
    }
  end

  @doc false
  def school() do
    current_state().schoolname
  end

  defp current_state() do
    Agent.get(__MODULE__, fn state -> state end)
  end
end
