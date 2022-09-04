defmodule Ff1Web.OverviewLive do
  use Ff1Web, :live_view
  alias Ff1.Accounts.Player

  def mount(_param, _session, socket) do
    {:ok, socket}
  end

  def handle_event("driver-selected", params, socket) do
    IO.puts("hilla")
    IO.inspect(params)
    #socket = assign(socket, :drivers_selected, params)
    {:noreply, socket}
  end

  def render(assigns) do
    #IO.inspect(assigns.socket)
    if Map.has_key?(assigns, :player_id) do
      player = Player.get_player_by_id(assigns.player_id)
      ~H"""
        <h1>FF1</h1>
      """
    else
      all_drivers = Ff1.Drivers.Driver.get_all_drivers()
      ~H"""
        <h1>Pick team</h1>
        <form phx-change="driver-selected" phx-submit="save">
          <%= for i <- 1..4 do %>
            <label>Driver <%= i %>:</label>
            <select name={"driver#{i}"} id={"driver#{i}"}>
                <option disabled selected value>-- select a driver --</option>
              <%= for driver <- all_drivers do %>
                <option value={driver.id}><%= driver.driver_name %>   <%= driver.driver_price %></option>
              <% end %>
            </select>
          <% end %>
        </form>
      """
    end
  end
end
