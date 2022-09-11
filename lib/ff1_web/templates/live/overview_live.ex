defmodule Ff1Web.OverviewLive do
  use Ff1Web, :live_view
  alias Ff1.Players.Player
  alias Ff1.Accounts.Account

  @number_drivers 4
  @budget 1000000
  
  def mount(_param, _session, socket) do
    socket = socket
      |> assign(:drivers_selected, %{})
      |> assign(:account_id, 0)
      |> assign(:player_id, 0)
      |> assign(:changeset, Account.changeset(%Account{}, %{}))
    {:ok, socket}
  end

  def update_drivers_selected(socket, params) do
    target = hd(Map.fetch!(params, "_target"))
    value = Map.fetch!(params, target)
    Map.put(socket.assigns.drivers_selected, target, value) 
  end

 # def handle_event("submit", params, socket) do
 #   IO.puts "Hilla"
 #   
 #   {:noreply, socket}
 # end

  def handle_event("save_account", %{"account" => params}, socket) do
    IO.puts("save_account")
    IO.inspect(params)
    case Account.create_account(params) do 
      {:ok, acc} -> 
        IO.puts("account created")
        IO.inspect(acc)
        socket = assign(socket, :account_id, acc.id)
        {:noreply, socket}
      {:error, %Ecto.Changeset{} = changeset} -> 
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  def handle_event("driver_selected", params, socket) do
    updated_drivers = update_drivers_selected(socket, params)
    socket = assign(socket, :drivers_selected, updated_drivers)
    {:noreply, socket}
  end

  def handle_event("save_player_team", params, socket) do
    IO.inspect(params)
    {:noreply, socket}
  end

  def handle_event("validate_account", params, socket) do 
    changeset = %Account{}
      |> Account.changeset(params)
    #socket = assign(socket, :changeset, changeset)
    {:noreply, socket}
  end

  def display_signup(assigns) do
    ~H"""
      <h1>FF1</h1>
      <.form let={f} for={@changeset} phx-change="validate_account" phx-submit="save_account">
        <%= label f, :email %>
        <%= text_input f, :email %>
        <%= error_tag f, :email %>

        <%= label f, :password_hash %>
        <%= text_input f, :password_hash %>
        <%= error_tag f, :password_hash %>
        
        <%= submit "Save" %>
      </.form>
    """
  end

  def render(assigns) do
    if (assigns.account_id == 0) do
      #player = Player.get_player_by_id(assigns.player_id)
      display_signup(assigns)
    else
      ~H"""
        <h1>Pick drivers</h1>
        <%= display_budget(assigns) %>
        <%= display_driver_select(assigns) %>
      """
    end
  end

  defp all_drivers() do
    Ff1.Drivers.Driver.get_all_drivers()
  end

  defp display_driver_prices(assigns) do
    all_drivers = all_drivers()
    ~H"""
    <h2>Driver Price List</h2>
    <table>
      <tr>
        <th>Driver</th>
        <th>Price</th>
      </tr>
      <%= for driver <- all_drivers do %>
        <tr>
          <td><%= driver.driver_name %></td>
          <td><%= driver.driver_price %></td>
        </tr>
      <% end %>
    </table>
    """
  end

  defp display_budget(assigns) do
    all_drivers = all_drivers()
    spent = Enum.reduce assigns.drivers_selected, 0, fn x, acc -> 
      {_driver_number, driver_id} = x
      {id, _res} = Integer.parse(driver_id)
      driver = hd Enum.filter(all_drivers, fn x -> x.id == id end)
      acc + driver.driver_price
    end
    budget = @budget - spent
    ~H"""
      <h2>Budget left: &#8383;<%= display_currency(budget) %></h2>
    """
  end


  defp display_currency(amount) do
    amount
    |> Integer.to_charlist
    |> Enum.reverse
    |> Enum.chunk_every(3)
    |> Enum.join(",")
    |> String.reverse
  end

  defp display_driver(assigns, driver) do
    ~H"""
      <%= driver.driver_name %>
      &#8383; <%= display_currency(driver.driver_price) %>
    """
  end

  defp display_driver_select(assigns) do
    num_drivers = @number_drivers
    all_drivers = all_drivers()
    ~H"""
    <form phx-change="driver_selected" phx-submit="save_player_team">
      <%= for i <- 1..num_drivers do %>
      <label>Driver <%= i %>:</label>
      <select name={"#{i}"} id={"#{i}"}>
        <option 
          disabled 
          selected={!Map.has_key?(assigns.drivers_selected, "#{i}")} 
          value>-- select a driver --</option>
        <%= for driver <- filter_selected_drivers(i, assigns.drivers_selected) do %>
        <option 
          value={driver.id} 
          selected={is_selected(assigns.drivers_selected, "#{i}", driver.id)}>
        <%= display_driver(assigns, driver) %>
        </option>
        <% end %>
      </select>
      <% end %>
      <br>
      <%= submit "Save" %>
    </form>
    """
  end

  defp is_selected(selected_drivers, driver_number, driver_id) do
    case selected_drivers[driver_number] do
      nil -> false
      num -> 
        {parsed, _res} = Integer.parse(num) 
        parsed == driver_id
    end
  end

  defp filter_selected_drivers(i, drivers_selected) do
    all_drivers = all_drivers()
    drivers_to_int = Enum.map(drivers_selected, fn {index, driver_id} -> 
      {parsed_index, _res} = Integer.parse(index)
      {parsed_id, _res} = Integer.parse(driver_id)
      {parsed_index, parsed_id}
    end)
    drivers_to_remove = Enum.filter(drivers_to_int, fn {index, _driver_id} -> 
      index != i
    end)
    drivers_to_remove_ids = Enum.map(
      drivers_to_remove, 
      fn {_index, driver_id} -> driver_id 
    end)
    Enum.filter(all_drivers, fn driver ->
      !Enum.member?(drivers_to_remove_ids, driver.id) end)
  end

end
