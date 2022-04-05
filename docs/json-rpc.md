# JSON-RPC

This library uses the Untis Mobile endpoint to get more data than other WebUntis libraries, such as irregular or cancelled periods. JSON-RPC must be used for the queries.

## Request

Requests should be structured as follows:

1) **Body**

```json
{
  id: 0,
  jsonrpc: "2.0",
  method: "yourMethod",
  params: []
}
```

1) **Headers**

The following header is perfectly sufficient: `Content-Type: application/json`

## Authentication

```json
{
  "user": username,
  "otp": generated one-time password,
  "clientTime": system time in milliseconds
}
```

The Untis library never saves passwords, but have to remember the shared app secret.
For further information see `Untis.Auth.JsonAuth.login/3`.

## Response

The endpoint responds with the following structure:

```json
{
  "jsonrpc": "2.0",
  "id": "",
  "result": { result }
}
```

All Untis function in the main module are decoding this JSON data. Structs like `Untis.Struct.Teacher` or `Untis.Struct.Period` represent the data from the endpoint.
