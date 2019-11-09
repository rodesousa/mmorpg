defmodule Mmorpg.Start do
  alias Mmorpg.Front.LoginScreen

  def init() do
    LoginScreen.display()
  end
end
