defmodule Mmorpg.Model.Fight.Action do
  @moduledoc """
  It's the heart of battle mode

  We have:
  - 2 `family` of action: offensive, defense
  - 6 action 

  # offensive
  - atk
  - overhead
  - feint

  # defensive
  - defense
  - dodge
  - counter

  The value of action (how many dmg, how many defense) depends on fighter stats

  Each action has a buff between `buff_min` and `buff_max`. We can see like `rage`

  For now we have `value` that is his dgt or the dgts that it can absorb.
  One day we can do a "triangle" as Fire Emblem with the following rules:
  tranchant > absorbant
  absorbant > contandent
  contendant > tranchant 
  etc..
  """

  defmacro __using__(opts) do
    quote do
      defstruct [
                  :family,
                  :buff_min,
                  :buff_max,
                  :value
                ] ++ unquote(opts)

      @type t :: %__MODULE__{
              family: atom(),
              buff_min: integer(),
              buff_max: integer(),
              value: integer()
            }
    end
  end

  @doc """
  Gets a random buff
  """
  def get_buff(action) do
    Enum.random(action.buff_min..action.buff_max)
  end
end
