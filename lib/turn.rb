class Turn
  attr_reader :guess, :card
  def initialize(guess, card)
    @card = card
    @guess = guess
  end

  def correct?
    @card.answer == guess
  end

  def feedback
    if self.correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end 

end