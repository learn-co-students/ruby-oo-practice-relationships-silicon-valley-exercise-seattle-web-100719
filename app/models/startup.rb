class Startup

    attr_accessor :name, :domain
    attr_reader :founder
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end
        
    def pivot(domain, name)
        self.domain = domain
        self.name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        @@all.each do |startup|
            if startup.name == founder_name
                return startup.name
            end
        end
        nil
    end

    def self.domains
        arr = []
        @@all.each do |startup|
            arr << startup.domain
        end
        arr.uniq
    end

    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(venture_capitalist, type, amount, self)
    end

    def num_funding_rounds
        FundingRound.all.select do |fundinground|
            fundinground.startup == self
        end.size
    end

    def total_funds
        sum = 0
        FundingRound.all.each do |fundinground|
            if fundinground.startup == self
                sum += fundinground.investment
            end
        end
    end

    def investors
        arr = []
        FundingRound.all.each do |fundinground|
            if fundinground.startup == self
                arr << fundinground.venture_capitalist
            end
        end
        arr
    end

    def big_investors
        self.investors.select do |investor|
            investor.total_funds > 1000000000
        end
    end
   
end
