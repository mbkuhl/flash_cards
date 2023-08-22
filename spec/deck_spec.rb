require './lib/deck'
require './lib/card'

card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
cards = [card1, card2, card3]

RSpec.describe Deck do
  it 'exists' do
    deck = Deck.new(cards)

    expect(deck).to be_instance_of(Deck)
  end

  it 'can contain cards' do
    deck = Deck.new(cards)

    expect(deck.cards.count).to eq(3)
    expect(deck.cards[0]).to eq(card1)
  end

  it 'can tell how many cards are in each category' do
    deck = Deck.new(cards)

    expect(deck.cards_in_category(:STEM)).to eq(2)
    expect(deck.cards_in_category(:Geography)).to eq(1)
    expect(deck.cards_in_category("Pop Culture")).to eq(0)
  end



end