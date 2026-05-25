defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start(fn -> %{list: [], index: 0} end)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn map -> map.list end)
  end

  def register(pid, register_to) do
    plot_id = get_index(pid) + 1
    plot = %Plot{plot_id: plot_id, registered_to: register_to}
    Agent.update(pid, fn map -> %{list: [plot | map.list], index: plot_id} end)
    plot
  end

  defp get_index(pid) do
    Agent.get(pid, fn map -> map.index end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn map -> Map.put(map, :list, filter_list(map.list, plot_id)) end)
  end

  defp filter_list(list, plot_id) do
    for plot <- list, plot.plot_id != plot_id, do: plot
  end

  def get_registration(pid, plot_id) do
    default = {:not_found, "plot is unregistered"}
    list_registrations(pid)
    |> Enum.find(default, fn %Plot{} = plot -> plot.plot_id == plot_id end)
  end
end
