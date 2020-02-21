defmodule Mmorpg.Model.Fight.Status do
  @moduledoc """
  Information during a fight

  - `:fighting_order` can be first or last and determines when begins
  - `:action` is action during the fight
  - `:strategy` is the way that determines the current action. See `Mmorpg.Controller.Fight` and `Mmorpg.Controller.Fight.Strategy`
  - `:buff` an integer beteween Action.buff_min and Actio.buff_max that up the dmgs or resist of a action
  """
  alias Mmorpg.Model.Fight.Action
  # alias Mmorpg.Controller.Fight.Strategy

  defstruct [
    :fighting_order,
    :action,
    :strategy,
    :buff
  ]

  @type t :: %__MODULE__{
          fighting_order: fighting_order,
          action: Action.t(),
          buff: integer()
        }

  @type life :: :dead | :alive
  @type fighting_order :: :first | :last | nil
end
