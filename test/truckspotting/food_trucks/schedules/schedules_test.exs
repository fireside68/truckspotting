defmodule Truckspotting.FoodTrucks.Schedules.SchedulesTest do
  use Truckspotting.DataCase
  import Truckspotting.FoodTrucksFixtures

  alias Truckspotting.FoodTrucks.Schedule
  alias Truckspotting.FoodTrucks.Schedules


    @invalid_attrs %{end: nil, int_day_of_week: nil, start: nil, string_day_of_week: nil}

    test "list_schedules/0 returns all schedules" do
      schedule = schedule_fixture()
      assert Schedules.list_schedules() == [schedule]
    end

    test "get_schedule!/1 returns the schedule with given id" do
      schedule = schedule_fixture()
      assert Schedules.get_schedule!(schedule.id) == schedule
    end

    test "create_schedule/1 with valid data creates a schedule" do
      valid_attrs = %{end: ~T[14:00:00], int_day_of_week: 42, start: ~T[14:00:00], string_day_of_week: "some string_day_of_week"}

      assert {:ok, %Schedule{} = schedule} = Schedules.create_schedule(valid_attrs)
      assert schedule.end == ~T[14:00:00]
      assert schedule.int_day_of_week == 42
      assert schedule.start == ~T[14:00:00]
      assert schedule.string_day_of_week == "some string_day_of_week"
    end

    test "create_schedule/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedules.create_schedule(@invalid_attrs)
    end

    test "update_schedule/2 with valid data updates the schedule" do
      schedule = schedule_fixture()
      update_attrs = %{end: ~T[15:01:01], int_day_of_week: 43, start: ~T[15:01:01], string_day_of_week: "some updated string_day_of_week"}

      assert {:ok, %Schedule{} = schedule} = Schedules.update_schedule(schedule, update_attrs)
      assert schedule.end == ~T[15:01:01]
      assert schedule.int_day_of_week == 43
      assert schedule.start == ~T[15:01:01]
      assert schedule.string_day_of_week == "some updated string_day_of_week"
    end

    test "update_schedule/2 with invalid data returns error changeset" do
      schedule = schedule_fixture()
      assert {:error, %Ecto.Changeset{}} = Schedules.update_schedule(schedule, @invalid_attrs)
      assert schedule == Schedules.get_schedule!(schedule.id)
    end

    test "delete_schedule/1 deletes the schedule" do
      schedule = schedule_fixture()
      assert {:ok, %Schedule{}} = Schedules.delete_schedule(schedule)
      assert_raise Ecto.NoResultsError, fn -> Schedules.get_schedule!(schedule.id) end
    end

    test "change_schedule/1 returns a schedule changeset" do
      schedule = schedule_fixture()
      assert %Ecto.Changeset{} = Schedules.change_schedule(schedule)
    end
end
