defmodule Ff1Web.OverviewLive do
  use Ff1Web, :live_view
  alias Ff1.Accounts.Player

  def mount(_param, _session, socket) do
    socket = assign(socket, :drivers_selected, %{})
    socket = assign(socket, :budget, 1000000)
    socket = assign(socket, :all_drivers, Ff1.Drivers.Driver.get_all_drivers())
    {:ok, socket}
  end

  def update_drivers_selected(socket, params) do
    #IO.puts("hilla")
    #IO.inspect(params)
    target = hd(Map.fetch!(params, "_target"))
    #IO.inspect(target)
    value = Map.fetch!(params, target)
    #IO.inspect(value)
    Map.put(socket.assigns.drivers_selected, target, value) 
  end

  def handle_event("driver-selected", params, socket) do
    IO.inspect(params)
    #IO.inspect(socket.assigns)
    updated_drivers = update_drivers_selected(socket, params)
    socket = assign(socket, :drivers_selected, updated_drivers)
    #IO.inspect(socket.assigns)
    {:noreply, socket}
  end

  def display_driver_prices(assigns) do
    ~H"""
    <h2>Driver Price List</h2>
    <table>
      <tr>
        <th>Driver</th>
        <th>Price</th>
      </tr>
      <%= for driver <- assigns.all_drivers do %>
        <tr>
          <td><%= driver.driver_name %></td>
          <td><%= driver.driver_price %></td>
        </tr>
      <% end %>
    </table>
    """
  end

  defp display_budget(assigns) do
    #IO.inspect(assigns.all_drivers)
    #IO.inspect(assigns.drivers_selected)
    spent = Enum.reduce assigns.drivers_selected, 0, fn x, acc -> 
      #IO.inspect(x)
      {_driver_number, driver_id} = x
      {id, _res} = Integer.parse(driver_id)
      driver = hd Enum.filter(assigns.all_drivers, fn x -> x.id == id end)
      acc + driver.driver_price
    end
    #IO.inspect(spent)
    budget = assigns.budget - spent
    ~H"""
      <h2>Budget left: &#8383;<%= budget %></h2>
    """
  end

  defp display_driver_select(assigns) do
    ~H"""
    <form phx-change="driver-selected" phx-submit="save">
      <%= for i <- 1..4 do %>
        <label>Driver <%= i %>:</label>
        <select name={"driver#{i}"} id={"driver#{i}"}>
            <option disabled selected value>-- select a driver --</option>
          <%= for driver <- assigns.all_drivers do %>
            <option value={driver.id}><%= driver.driver_name %></option>
          <% end %>
        </select>
      <% end %>
    </form>
    """
  end

  def render(assigns) do
    #IO.inspect(assigns)
    if Map.has_key?(assigns, :player_id) do
      player = Player.get_player_by_id(assigns.player_id)
      ~H"""
        <h1>FF1</h1>
      """
    else
      ~H"""
        <h1>Pick drivers</h1>
        <%= display_budget(assigns) %>
        <%= display_driver_select(assigns) %>
        <%= display_driver_prices(assigns) %>
      """
    end
  end
end
