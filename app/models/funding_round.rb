class FundingRound

    attr_accessor :investment
    attr_reader :startup, :venture_capitalist, :type
    @@all = []

    def initialize(venture_capitalist, type, investment, startup)
        @investment = investment
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @@all << self
    end

    def self.all
        @@all
    end







end
