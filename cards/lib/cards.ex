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
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]

    for suit <- suits do
      
      for value <- values do
        "#{value} of #{suit}"
      end

    end
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
