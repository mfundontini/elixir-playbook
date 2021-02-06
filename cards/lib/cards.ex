defmodule Cards do
  @moduledoc """
  Documentation for `Cards` module which is used for:
   1. Creating a hand/deck of cards.
   2. Shuffling a hand/deck cards.
   3. Saving a hand/deck.
   4. Loading a hand/deck.
   5. Assessing if a hand/deck contains a specific card.
  """

  defp create_deck_meh() do
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

  @doc """
  Creates a 52 card deck.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> deck
      ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades",
      "Five of Spades", "Six of Spades", "Seven of Spades", "Eight of Spades",
      "Nine of Spades", "Ten of Spades", "Jack of Spades", "Queen of Spades",
      "King of Spades", "Ace of Hearts", "Two of Hearts", "Three of Hearts",
      "Four of Hearts", "Five of Hearts", "Six of Hearts", "Seven of Hearts",
      "Eight of Hearts", "Nine of Hearts", "Ten of Hearts", "Jack of Hearts",
      "Queen of Hearts", "King of Hearts", "Ace of Clubs", "Two of Clubs",
      "Three of Clubs", "Four of Clubs", "Five of Clubs", "Six of Clubs",
      "Seven of Clubs", "Eight of Clubs", "Nine of Clubs", "Ten of Clubs",
      "Jack of Clubs", "Queen of Clubs", "King of Clubs", "Ace of Diamonds",
      "Two of Diamonds", "Three of Diamonds", "Four of Diamonds", "Five of Diamonds",
      "Six of Diamonds", "Seven of Diamonds", "Eight of Diamonds",
      "Nine of Diamonds", "Ten of Diamonds", "Jack of Diamonds", ...]

  """
  def create_deck() do
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]

    # Nested comprehensions can also take this form where hierachy is from right to left, lowest to highest
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Shuffles a deck of cards.
  """
  def shuffle(deck) do
    # Function arguments are passed by value, and are thus immutable
    # Function signatures are of the form function/no_of_args eg shuffle/1
    # Implicit return statements, explicit return causes a complilation error
    Enum.shuffle(deck)
  end

  @doc """
  Checks if as card is contained within a deck.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> contained = Cards.contains?(deck, "Ace of Spades")
      iex> contained
      true

  """
  def contains?(deck, card) do
    # Standard library, is it called that, functions need not be imported or installed in any way
    # Append ? to functions that return Booleans => convention!
    Enum.member?(deck, card)
  end

  @doc """
  Deals a hand from the deck, where `count` is the number of crads on the hand.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> {hand, _rest} = Cards.deal(deck, 2)
      iex> hand
      ["Ace of Spades", "Two of Spades"]

  """
  def deal(deck, count) do
    # Returns a tuple
    Enum.split(deck, count)
  end

  @doc """
  Saves cards into a file with `filename` specified.
  """  
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

  @doc """
  Loads cards stored in a file with `filename` specified.
  """  
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "#{filename} not loaded successfully."
    end
  end

  @doc """
  Creates a `hand_size` amount of cards hand, which is randomized.
  """  
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
