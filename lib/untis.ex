defmodule Untis do
  @moduledoc """
  Documentation for Untis.

  Code example:

  ```elixir
  # Requests require a valid login.
  Untis.Auth.JsonAuth.login("max.mustermann", "2W9ZNXI472JLVH63", "test-school")

  today = Date.utc_today()

  Untis.timetable_student(
    420,
    Date.beginning_of_week(today),
    Date.beginning_of_week(today)
    |> Date.add(5)
  )
  ```
  """

  import Untis.JsonRpc
  import Untis.Parser

  @method_timetable "getTimetable2017"
  @method_homework "getHomeWork2017"
  @method_messages "getMessagesOfDay2017"
  @method_absences "getStudentAbsences2017"
  @method_userdata "getUserData2017"

  @doc """
  Returns the timetable for a given time.

  ```elixir
  # List all periods for today.
  timetable_student(889, Date.utc_today(), Date.utc_today())
  ```
  """
  def timetable_student(id, start_date, end_date) do
    request(@method_timetable, %{
      "id" => id,
      "type" => "STUDENT",
      "startDate" => start_date,
      "endDate" => end_date
    })
    |> parse_timetable()
  end

  @doc """
  Does the same as `timetable_student`, only for classes.
  """
  def timetable_class(id, start_date, end_date) do
    request(@method_timetable, %{
      "id" => id,
      "type" => "CLASS",
      "startDate" => start_date,
      "endDate" => end_date
    })
    |> parse_timetable()
  end

  @doc """
  Returns all homework for the given range.

  ```elixir
  # List all homework for the next seven days.
  homework_student(
      889,
      Date.utc_today(),
      Date.utc_today() |> Date.add(7)
    )
  ```
  """
  def homework_student(id, start_date, end_date) do
    request(@method_homework, %{
      "id" => id,
      "type" => "STUDENT",
      "startDate" => start_date,
      "endDate" => end_date
    })
    |> parse_response()
    |> Map.fetch!("homeWorks")
  end

  @doc """
  Returns the messages of the day.
  """
  def messages(date) do
    request(@method_messages, %{"date" => date})
    |> parse_response()
    |> Map.fetch!("messages")
  end

  @doc """
  Returns all absences for the given range.
  Also see `Untis.Struct.Absence` structs.
  """
  def absences(start_date, end_date, include_excused, include_unexcused) do
    request(@method_absences, %{
      "startDate" => start_date,
      "endDate" => end_date,
      "includeExcused" => include_excused,
      "includeUnExcused" => include_unexcused
    })
    |> parse_absence()
  end

  @doc """
  Returns a variety of data:
  * master data (used internally to resolve elements)
  * settings
  * messenger settings
  * "real" user data (e.g. student id or display name)
  """
  def userdata do
    request(@method_userdata, %{})
    |> parse_response()
  end

  @doc false
  def master_data do
    request(@method_userdata, %{})
    |> parse_response()
    |> Map.fetch!("masterData")
  end
end
