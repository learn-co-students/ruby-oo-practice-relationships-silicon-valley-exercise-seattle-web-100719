require_relative 'venture_capitalist'
require_relative 'startup'

class FundingRound

    attr_reader :startup, :investment
    attr_accessor :type, :venture_capitalist

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @investment = investment
        @type = type
        @startup = startup
        @venture_capitalist = venture_capitalist
        @@all << self
    end

    def self.all
        @@all
    end
end
