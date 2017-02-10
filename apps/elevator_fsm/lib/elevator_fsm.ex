defmodule EFSM do
  @moduledoc """
  Documentation for EFSM.
  """

  @doc """
  Hello world.

  ## Examples

      iex> EFSM.hello
      :world

  """
  def start do
    Task.spawn_link(fn -> fsm({:ok, :idle}) end)
  end

  defp fsm(state) do
      case state do
        {:ok, :idle} -> #Send to Order_manager the idle state of this elevator
        {:ok, :moving} -> #Send to elevator_OM and elevator_driver that the elevator should be moving.
        {:ok, :open_doors} -> #Send to elevator_OM and elevator_driver that the dors are opening.
        {:error, :stuck} -> #The elevator seems to be stuck! Send to elevator_OM that it is so.
        {:error, _} -> #Somethin g else is wrong, unknown state. Send this to elevator_OM
      end
  end

  defp handle_input(message) do
    receive do
      # {:ok, {:floor_reached, :awaiting_orders}, caller} ->
        #send IDLE to fsm(state)

        
    end
  end
end
