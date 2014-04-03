--[[ Class to create a stack of cards ]]--

require "card"

Stack = {}

function Stack.new (size, initial_cards)
    local self = {}

    --[[ Private Variables ]]--
    local cards = initial_cards or {}

    -- If no initial cards exist, make a random stack
    if #cards == 0 or not cards[1].get_id then
       math.randomseed(os.time())
       for i = 1, (size or math.random(52)) do
           cards[i] = Card.new()
       end
    end

    --[[ Public Methods ]]-- 

    -- Check how many cards are in stack
    function self.get_size ()
        return #cards
    end

    -- Return specified card (or whole stack)
    -- without removing the revealed cards
    -- from the stack
    function self.get_cards (position)
        return position and cards[position] or cards
    end

    -- Shuffle the order of the cards in stack
    function self.shuffle ()
        local n = #cards
        math.randomseed(os.time())

        repeat
            local x = math.random(n)
            cards[n], cards[x] = cards[x], cards[n]
            n = n - 1
        until n <= 2
    end

    -- Add a card to the stack
    function self.draw (card)
        cards[#cards + 1] = card.get_id and card or nil
    end

    -- Return a card from the stack
    function self.deal (position)
        return table.remove(cards, position or #cards)
    end

    return self
end
