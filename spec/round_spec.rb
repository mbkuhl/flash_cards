require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'



RSpec.describe Round do

  card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)

  it 'exists' do
    round = Round.new(deck)
  
    expect(round).to be_instance_of(Round)
  end

  it 'has a deck' do
    round = Round.new(deck)
  
    expect(round.deck).to eq(deck)
  end

  it 'can have turns' do
    round = Round.new(deck)
  
    expect(round.turns).to eq([])
  end

  it 'has a current flash card' do
    round = Round.new(deck)

    expect(round.current_card).to eq(deck.cards[0])
  end

  it 'can take a turn and create turn instance' do
    round = Round.new(deck)
    
    new_turn = round.take_turn("Juneau")

    expect(new_turn).to be_instance_of(Turn)
  end

  it 'can be correct' do
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    expect(new_turn.correct?).to be true
  end

  it 'can remember turns taken' do
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    expect(round.turns).to eq([new_turn])
  end

  it 'can store number of turns and number of correct answers' do
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.turns.count).to eq(0)
    expect(round.number_correct).to eq(0)
    round.take_turn("Juneau")
    expect(round.turns.count).to eq(1)
    expect(round.number_correct).to eq(1)
    round.take_turn("Venus")
    expect(round.turns.count).to eq(2)
    expect(round.number_correct).to eq(1)
    round.take_turn("North north west")
    expect(round.turns.count).to eq(3)
    expect(round.number_correct).to eq(2)
  end

  it 'can get feedback from turns taken' do
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    round.take_turn("Juneau")
    expect(round.turns.last.feedback).to eq("Correct!")
    round.take_turn("Venus")
    expect(round.turns.last.feedback).to eq("Incorrect.")
  end

 

end