defmodule Untis.Struct.Class do
  defstruct [
    :id,
    :name,
    :long_name,
    :department_id,
    :start_date,
    :end_date,
    :fore_color,
    :back_color,
    :active,
    :displayable
  ]

  @doc false
  def from_map(jason_map) when is_nil(jason_map) do
    nil
  end

  @doc false
  def from_map(jason_map) do
    %Untis.Struct.Class{
      id: Map.get(jason_map, "id"),
      name: Map.get(jason_map, "name"),
      long_name: Map.get(jason_map, "longName"),
      department_id: Map.get(jason_map, "departmentId"),
      start_date: Map.get(jason_map, "startDate"),
      end_date: Map.get(jason_map, "endDate"),
      fore_color: Map.get(jason_map, "foreColor"),
      back_color: Map.get(jason_map, "backColor"),
      active: Map.get(jason_map, "active"),
      displayable: Map.get(jason_map, "displayable")
    }
  end
end
