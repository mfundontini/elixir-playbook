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
  def create_deck_meh() do
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]

    # For statements/list comprehensions are maps of a sort and each context will return a list, thus nested for.. statements will
    # Produce nested lists. List.flatten recursively flattens lists, this is not the best solution. 
    cards = for suit <- suits do
      
      for value <- values do
        "#{value} of #{suit}"
      end

    end

    List.flatten(cards)
  end

  def create_deck() do
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]

    # Nested comprehensions can also take this form where hierachy is from right to left, lowest to highest
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    # Function arguments are passed by value, and are thus immutable
    # Function signatures are of the form function/no_of_args eg shuffle/1
    # Implicit return statements, explicit return causes a complilation error
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    # Standard library, is it called that, functions need not be imported or installed in any way
    # Append ? to functions that return Booleans => convention!
    Enum.member?(deck, card)
  end

  def deal(deck, count) do
    # Returns a tuple
    Enum.split(deck, count)
  end
end
