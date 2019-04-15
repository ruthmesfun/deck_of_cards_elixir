defmodule Cards do

  @moduledoc """
      Provides methods for creating and handling a deck of cards
  """
  # iex -S mix << to test elixir in the terminal
  # recompile to recompile the files for the terminal.

  @doc """
    Returns a list of drings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
         "#{suit} of #{value}"
    end

    # less optimal way
    # suits_values = for suit <- suits do
    #   for value <- values do
    #      "#{suit} of #{value}"
    #   end
    # end

    # List.flatten(suits_values)
  end



  def shuffle(deck) do
    Enum.shuffle(deck)
  end


  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck.
  The `hand_size` argument indicated how many cards should be in the hand (integer).

  ## Examples
      iex> deck = Cards.create_deck
      iex> {hand. deck} = Cards.deal(deck,1)
      iex> hand
      ["Ace of Spades"]

  """

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary deck
    File.write(filename,binary)
  end

  @spec load(
          binary()
          | maybe_improper_list(
              binary() | maybe_improper_list(any(), binary() | []) | char(),
              binary() | []
            )
        ) :: any()
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
      # deck = create_deck()
      # shuffled_deck = shuffle(deck)

      # deal(shuffled_deck, hand_size)

      # Using the pipe operator
        create_deck()
        |> shuffle
        |> deal(hand_size)
  end


end
