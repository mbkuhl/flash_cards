require './lib/turn'

class Round
  attr_accessor :deck, :turns, :turn_count,:number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_count
    @current_card
    @number_correct = 0
  end

  def current_card
    @current_card = deck.cards[0]
  end

  def take_turn(answer)
    card = self.current_card
    turn1 = Turn.new(answer, card)
    deck.cards.shift
    turns << turn1
    if turn1.correct?
      @number_correct += 1
    end
    turn1
  end


end