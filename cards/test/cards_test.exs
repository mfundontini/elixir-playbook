defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "greets the world" do
    assert Cards.hello() == :world
  end

  test "52 card deck" do
    deck = Cards.create_deck()
    assert length(deck)== 52
  end

  assert "20 hand deck" do
    {hand, _rest} = Cards.create_hand(20)
    assert length(hand) == 20
  end

  test "deck shuffled" do
    deck = Cards.create_deck()
    shuffled = Cards.shuffle(deck)
    assert deck != shuffled
  end

  test "shuffled deck contains ace of spades" do
    deck = Cards.create_deck()
    shuffled = Cards.shuffle(deck)
    assert Cards.contains?(shuffled, "Ace of Spades")
  end

  test "normal deck contains ace of spades" do
    deck = Cards.create_deck()
    assert Cards.contains?(deck, "Ace of Spades")
  end

end
