require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card4 = Card.new("Who are the two creators of TMNT in 1982", "Peter Lardman and Kevin Eastman", "Pop Culture")
card5 = Card.new("Who is the frontman of the band Muse", "Matthew Bellamy", "Pop Culture")
card6 = Card.new("What band was Beyonce part of before she went solo", "Destiny's Child", "Pop Culture")
card7 = Card.new("By what other name is Myanmar known by", "Burma", :Geography)
cards = [card1, card2, card3, card4, card5, card6, card7]
deck = Deck.new(cards)