--[[ Class for constructing a card player ]]--

require "stack"

Player = {}

names = { "Sam", "Xenia", "Ian", "John", "Jack", "DeMarro",
          "Rebecca", "Stacie", "Mike", "Aaron", "Blaine", "Britany",
          "Joshua", "Anthony", "Xavier", "Slurms McKenzie", "Heather",
          "Wendy" }

function Player.new (name, bank, wins, losses, hand)
    local self = {}
    
    if not name then math.randomseed(os.time()) end

    --[[ Private Variables ]]--
    local name = name or names[math.random(#names)]
    local bank = bank or 0
    local wins = wins or 0
    local losses = losses or 0
    local hand = hand or Stack.new(0)

    --[[ Public Methods ]]--
    function self.get_name ()
        return name
    end

    function self.get_bank ()
        return bank
    end

    function self.get_win_percentage ()
        return losses > 0 and (wins / (wins + losses)) or (wins + losses)
    end

    function self.get_hand ()
        return hand
    end

    function self.update_bank (winnings)
        bank = bank + winnings
    end

    function self.update_record (dw, dl)
        wins = wins + (dw or 0)
        losses = losses + (dl or 0)
    end

    function self.draw (stack, count)
        for i = 1, count or 1 do
            hand.draw(stack.deal())
        end
    end

    function self.play (position)
        return hand.get_cards(position)
    end

    function self.update_hand (cards)
        hand = cards or Stack.new(0)
    end

    return self
end
