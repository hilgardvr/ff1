defmodule Ff1Web.OverviewLive do
  use Ff1Web, :live_view
  import Ff1.Accounts.Player

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
      ~H"""
        <h1>Not signed in</h1>
      """
    end
  end
end
