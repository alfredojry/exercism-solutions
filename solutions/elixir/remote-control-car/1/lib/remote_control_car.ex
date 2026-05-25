defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: meters}) do
    "#{meters} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: 0}) do
    "Battery empty"
  end

  def display_battery(%RemoteControlCar{battery_percentage: value}) do
    "Battery at #{value}%"
  end

  def drive(%RemoteControlCar{nickname: nickname, battery_percentage: 0, distance_driven_in_meters: meters}) do
    %{new(nickname) | battery_percentage: 0, distance_driven_in_meters: meters}
  end

  def drive(%RemoteControlCar{nickname: nickname, battery_percentage: perc, distance_driven_in_meters: meters}) do
    %{new(nickname) | battery_percentage: perc - 1, distance_driven_in_meters: meters + 20}
  end
end
