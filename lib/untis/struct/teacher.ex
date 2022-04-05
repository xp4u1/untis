defmodule Untis.Struct.Teacher do
  defstruct [
    :id,
    :name,
    :first_name,
    :last_name,
    :department_ids,
    :fore_color,
    :back_color,
    :entry_date,
    :exit_date,
    :active,
    :display_allowed
  ]

  @doc false
  def from_map(jason_map) when is_nil(jason_map) do
    nil
  end

  @doc false
  def from_map(jason_map) do
    %Untis.Struct.Teacher{
      id: Map.get(jason_map, "id"),
      name: Map.get(jason_map, "name"),
      first_name: Map.get(jason_map, "firstName"),
      last_name: Map.get(jason_map, "lastName"),
      department_ids: Map.get(jason_map, "departmentIds"),
      fore_color: Map.get(jason_map, "foreColor"),
      back_color: Map.get(jason_map, "backColor"),
      entry_date: Map.get(jason_map, "entryDate"),
      exit_date: Map.get(jason_map, "exitDate"),
      active: Map.get(jason_map, "active"),
      display_allowed: Map.get(jason_map, "displayAllowed")
    }
  end
end
