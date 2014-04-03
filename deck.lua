--[[ 
     Subclass of stack to create a standard
     deck of playing cards
]]--

require "stack"
require "card"

Deck = {}

function Deck.new (jokers)
    -- Private variables --
    local cards = {}

    -- Add cards for a standard deck
    for i = 1, 52 do
        cards[i] = i <= 13 and Card.new(Rank[i], Suit[1]) or
                   i <= 26 and Card.new(Rank[i-13], Suit[2]) or
                   i <= 39 and Card.new(Rank[i-26], Suit[3]) or
                   i <= 52 and Card.new(Rank[i-39], Suit[4])
    end

    -- Add jokers if desired
    if jokers and jokers > 0 then
        for i = 1, jokers do
            cards[#cards + 1] = Card.new(Rank[14])
        end
    end

    -- Create stack of cards
    return Stack.new(#cards, cards)
end
