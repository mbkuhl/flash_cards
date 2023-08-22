require './lib/turn'
require './lib/card'

RSpec.describe Card do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  it 'exists' do
    turn = Turn.new("Juneau", card)
  
    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    turn = Turn.new("Juneau", card)
    
    expect(turn.guess).to eq("Juneau")
  end

  it 'can be correct' do
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to be true
    expect(turn.feedback).to eq("Correct!")
  end

  it 'can be incorrect' do
    turn = Turn.new("Fairbanks", card)

    expect(turn.correct?).to be false
    expect(turn.feedback).to eq("Incorrect.")
  end

end
