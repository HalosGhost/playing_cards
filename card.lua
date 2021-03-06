-- Simple class for creating any card
-- in a standard deck of playing cards

Card = {}

Rank = { 'A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', '★' }
Suit = { '♢', '♣', '♡', '♠' }

math.randomseed(os.time())

function Card.new (rank, suit)
    local self = {}

    -- Private Variables --
    local rank = rank or Rank[math.random(#Rank-1)]
    local suit = suit or Suit[math.random(#Suit)]

    -- Public Methods --
    function self.is_joker ()
        return (rank == Rank[14])
    end

    function self.get_id ()
        if self.is_joker() then
            return "  " .. rank
        elseif tonumber(rank) ~= nil and tonumber(rank) == 10 then
            return rank .. suit
        else
            return " " .. rank .. suit
        end
    end

    function self.get_rank ()
        return rank
    end

    function self.get_suit ()
        return suit
    end

    return self
end
