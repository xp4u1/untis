defmodule Untis.Struct.Period do
  @code_regular "REGULAR"
  @code_cancelled "CANCELLED"
  @code_irregular "IRREGULAR"
  @code_exam "EXAM"

  defstruct [
    :id,
    :lesson_id,
    :start_date_time,
    :end_date_time,
    :fore_color,
    :back_color,
    :inner_fore_color,
    :inner_back_color,
    :text,
    :elements,
    :can,
    :is,
    :homework,
    :messenger_channel,
    :exam
  ]

  @doc false
  def from_map(jason_map) when is_nil(jason_map) do
    nil
  end

  @doc false
  def from_map(jason_map) do
    %Untis.Struct.Period{
      id: Map.get(jason_map, "id"),
      lesson_id: Map.get(jason_map, "lessonId"),
      start_date_time: Map.get(jason_map, "startDateTime") |> untis_to_iso(),
      end_date_time: Map.get(jason_map, "endDateTime") |> untis_to_iso(),
      fore_color: Map.get(jason_map, "foreColor"),
      back_color: Map.get(jason_map, "backColor"),
      inner_fore_color: Map.get(jason_map, "innerForeColor"),
      inner_back_color: Map.get(jason_map, "innerBackColor"),
      text: Map.get(jason_map, "text"),
      elements:
        Map.get(jason_map, "elements")
        |> Enum.map(fn element -> Untis.Parser.parse_element(element) end),
      can: Map.get(jason_map, "can"),
      is: Map.get(jason_map, "is"),
      homework: Map.get(jason_map, "homeWorks"),
      messenger_channel: Map.get(jason_map, "messengerChannel"),
      exam: Map.get(jason_map, "exam")
    }
  end

  def regular?(period) do
    Enum.at(period.is, 0) == @code_regular
  end

  def special?(period) do
    Enum.member?(period.is, @code_irregular) ||
      Enum.member?(period.is, @code_exam)
  end

  def cancelled?(period) do
    Enum.member?(period.is, @code_cancelled)
  end

  defp untis_to_iso(untis_date) do
    iso =
      untis_date
      |> String.replace("Z", ":00Z")

    {:ok, date, _utc_offset} = DateTime.from_iso8601(iso)

    date
  end
end
