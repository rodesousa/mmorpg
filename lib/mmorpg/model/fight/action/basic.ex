defmodule Mmorpg.Model.Fight.Action.Atack do
  @moduledoc false
  use Mmorpg.Model.Fight.Action,
    buff_min: 1,
    buff_max: 3,
    family: :offensive,
    value: 3
end

defmodule Mmorpg.Model.Fight.Action.Defense do
  @moduledoc false
  use Mmorpg.Model.Fight.Action,
    buff_min: 1,
    buff_max: 3,
    family: :defensive,
    value: 3
end
