defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  def create_deck() do
    # Implicit return statements, explicit return causes a complilation error
    ["Ace of Spades", "Two of Hearts", "Three of Clubs", "Four of Diamonds", "Five of Spades"]
  end

  def shuffle(deck) do
    # Function arguments are passed by value, and are thus immutable
    # Function signatures are of the form function/no_of_args eg shuffle/1
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    # Standard library, is it called that, functions need not be imported or installed in any way
    # Append ? to functions that return Booleans => convention!
    Enum.member?(deck, card)
  end
end
