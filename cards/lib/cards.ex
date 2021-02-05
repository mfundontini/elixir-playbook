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
    ["Ace of Spades", "Two of Hearts", "Three of Clubs", "Four of Diamonds", "Five of Spades"]
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end
end
