defmodule Ff1Web.OverviewLive do
  use Ff1Web, :live_view
  alias Ff1.Accounts.Player

  def mount(_param, _session, socket) do
    {:ok, socket}
  end


  def render(assigns) do
    if Map.has_key?(assigns, :player_id) do
      player = Player.get_player_by_id(assigns.player_id)
      ~H"""
        <h1>FF1</h1>
      """
    else
      all_drivers = Ff1.Drivers.Driver.get_all_drivers()
      ~H"""
        <h1>Pick team</h1>
        <label for="driver1">Driver 1:</label>
        <select name="driver1" id="driver1">
          <%= for driver <- all_drivers do %>
            <option value={driver.id}><%= driver.driver_name %></option>
          <% end %>
        </select>
      """
    end
  end
end
