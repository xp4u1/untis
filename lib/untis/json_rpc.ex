defmodule Untis.JsonRpc do
  @moduledoc false

  def request(method, params) do
    params = Map.put(params, "auth", Untis.Auth.JsonAuth.auth_map())

    # params as list
    data = %{"jsonrpc" => "2.0", "id" => "", "method" => method, "params" => [params]}

    HTTPoison.post!(
      "https://mese.webuntis.com/WebUntis/jsonrpc_intern.do?school=" <>
        Untis.Auth.JsonAuth.school(),
      Jason.encode!(data),
      [
        {"Content-Type", "application/json; charset=UTF-8"}
      ]
    ).body
  end
end
