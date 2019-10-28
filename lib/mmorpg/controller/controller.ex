defmodule Mmorpg.Controller do
  alias Mmorpg.Front.LoginScreen
  use Supervisor

  def start_link(_) do
    Supervisor.start_link(__MODULE__, nil, name: __MODULE__)
  end

  @impl true
  def init(_) do
    LoginScreen.display()
  end
end
