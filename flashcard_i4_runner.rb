require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

cards = []

file = File.open("cards.txt")
card_array = file.readlines.map(&:chomp)
card_array.each do |card|
  card_arguments = card.split(",")
  card_instance = Card.new(card_arguments[0], card_arguments[1], card_arguments[2])
  cards << card_instance
end

deck = Deck.new(cards)

round = Round.new(deck)

def start(round)
  card_count = 0
  round = round
  puts "Welcome! You're playing with #{round.deck.cards.count} cards."
  puts "-------------------------------------------------"
  while round.turns.count < round.initial_card_count
    round.current_card
    card_count += 1
    puts "This is card number #{card_count} out of #{round.initial_card_count}"
    puts "Question: #{round.current_card.question}"
    answer = gets.chomp
    round.take_turn(answer)
    puts round.turns.last.feedback
  end

  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{round.initial_card_count} for a total score of #{round.percent_correct}."
  puts "STEM - #{round.percent_correct_by_category("STEM")} correct"
  puts "Geography - #{round.percent_correct_by_category("Geography")} correct"
  puts "Pop Culture - #{round.percent_correct_by_category("Pop Culture")} correct"
end

start(round)
