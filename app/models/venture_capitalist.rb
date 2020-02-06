class VentureCapitalist

    attr_accessor :name
    attr_reader :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def offer_contract(startup, type, amount)
        FoundingRound.new(self, type, amount, startup)
    end

    def funding_rounds
        FundingRound.all.select do |fr|
            fr.venture_capitalist == self
        end
    end

    def portfolio
        arr = []
        FundingRound.all.each do |fr|
            if fr.venture_capitalist == self
                arr << fr.startup
            end
        end
        arr.uniq
    end

    def biggest_investment
        max = 0
        max_VC = nil
        FundingRound.all.each do |fr|
            if fr.ininvestment > max && fr.venture_capitalist == self
                max = fr.investment
                max_VC = fr.venture_capitalist
            end
        end
        max_VC
    end

    def invested(domain)
        sum = 0
        FundingRound.all.each do |fr|
            if fr.venture_capitalist == self
                if fr.startup.domain == domain
                    sum += fr.investment
                end
            end
        end
        sum
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select do |vc|
            vc.total_worth > 1000000000
        end
    end

end
