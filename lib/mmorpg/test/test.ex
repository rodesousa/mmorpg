defmodule Filter do
  # Define behaviours which user modules have to implement, with type annotations
  @callback transform(String.t()) :: String.t()

  defstruct [:test]

  # When you call use in your module, the __using__ macro is called.
  defmacro __using__(_params) do
    quote do
      # User modules must implement the Filter callbacks
      @behaviour Filter

      # Define implementation for user modules to use
      def shout, do: IO.puts("HEY!")
      def greet(s), do: IO.puts(s)

      # Defoverridable makes the given functions in the current module overridable
      # Without defoverridable, new definitions of greet will not be picked up
      defoverridable shout: 0, greet: 1
    end
  end

  def name do
    1
    |> IO.inspect()
  end
end

defmodule MyFilter do
  use Filter

  # Override default Filter implementation
  def greet(s), do: IO.puts("Sup " <> s)
end
