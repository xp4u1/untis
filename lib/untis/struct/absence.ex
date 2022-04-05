defmodule Untis.Struct.Absence do
  defstruct [
    :absence_reason,
    :absence_reason_id,
    :end_date_time,
    :excuse,
    :excused,
    :id,
    :klasse_id,
    :owner,
    :start_date_time,
    :student_id,
    :text
  ]

  @doc false
  def from_map(jason_map) when is_nil(jason_map) do
    nil
  end

  @doc false
  def from_map(jason_map) do
    %Untis.Struct.Absence{
      absence_reason: Map.get(jason_map, "absenceReason"),
      absence_reason_id: Map.get(jason_map, "absenceReasonId"),
      end_date_time: Map.get(jason_map, "endDateTime"),
      excuse: Map.get(jason_map, "excuse") |> Untis.Struct.Excuse.from_map(),
      excused: Map.get(jason_map, "excused"),
      id: Map.get(jason_map, "id"),
      klasse_id: Map.get(jason_map, "absenceReason"),
      owner: Map.get(jason_map, "owner"),
      start_date_time: Map.get(jason_map, "absenceReason"),
      text: Map.get(jason_map, "text")
    }
  end
end
