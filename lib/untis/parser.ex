defmodule Untis.Parser do
  @moduledoc false

  def parse_timetable(json) do
    response = parse_response(json)

    Untis.Cache.update_master_data(response["masterData"])

    response
    |> Map.fetch!("timetable")
    |> Map.fetch!("periods")
    |> Enum.map(fn period ->
      parse_period(period)
    end)
  end

  defp parse_period(period) do
    Untis.Struct.Period.from_map(period)
  end

  def parse_element(element) do
    case element["type"] do
      "CLASS" ->
        %{
          type: "CLASS",
          current:
            Untis.Cache.get_class(element["id"])
            |> List.first()
            |> Untis.Struct.Class.from_map(),
          orginal:
            Untis.Cache.get_class(element["orgId"])
            |> List.first()
            |> Untis.Struct.Class.from_map()
        }

      "TEACHER" ->
        %{
          type: "TEACHER",
          current:
            Untis.Cache.get_teacher(element["id"])
            |> List.first()
            |> Untis.Struct.Teacher.from_map(),
          orginal:
            Untis.Cache.get_teacher(element["orgId"])
            |> List.first()
            |> Untis.Struct.Teacher.from_map()
        }

      "SUBJECT" ->
        %{
          type: "SUBJECT",
          current:
            Untis.Cache.get_subject(element["id"])
            |> List.first()
            |> Untis.Struct.Subject.from_map(),
          orginal:
            Untis.Cache.get_subject(element["orgId"])
            |> List.first()
            |> Untis.Struct.Subject.from_map()
        }

      "ROOM" ->
        %{
          type: "ROOM",
          current:
            Untis.Cache.get_room(element["id"])
            |> List.first()
            |> Untis.Struct.Room.from_map(),
          orginal:
            Untis.Cache.get_room(element["orgId"])
            |> List.first()
            |> Untis.Struct.Room.from_map()
        }

      _ ->
        element
    end
  end

  def parse_absence(absence) do
    absence
    |> parse_response()
    |> Map.fetch!("absences")
    |> Enum.map(fn entry -> Untis.Struct.Absence.from_map(entry) end)
  end

  @doc false
  def parse_response(jsonrpc_response) do
    Jason.decode!(jsonrpc_response)["result"]
  end
end
