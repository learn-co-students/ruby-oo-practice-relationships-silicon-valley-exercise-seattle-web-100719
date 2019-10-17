require 'pry'

class FundingRound

    attr_accessor :startup, :venture_capitalist, :type, :amount
    @@all = []

    def initialize(startup, venture_capitalist, type, amount)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        if amount > 0
            @amount = amount.to_f
        else
            @amount = 0
        end
        @@all << self 
    end 

    def self.all
        @@all
    end 

end

binding.pry
0

