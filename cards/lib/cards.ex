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

  def save(deck, filename) do
    # File.write takes a filename and a chardata representation of the file, hence we are calling erlang's term_to_binary
    # Function to achieve this
    chardata = :erlang.term_to_binary deck

    # Pattern matching on a function will pipe its output to the case LHS
    case File.write(filename, chardata) do
      :ok -> "#{filename} written successfully."
      {:error, _reason} -> "#{filename} not written."
    end
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "#{filename} not loaded successfully."
    end
  end

  def create_hand(hand_size) do
    # Using the |> operator allows us to achieve the following lines of code
    # cards = Cards.create_deck()
    # shuffled = Cards.shuffle(cards)
    # hand = Cards.deal(shuffled, hand_size)
    # Note how the previous output is piped to the next function as the first argument
    
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
