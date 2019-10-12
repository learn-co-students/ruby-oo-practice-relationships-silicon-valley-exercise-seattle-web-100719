class VentureCapitalist
    attr_accessor :name, :total_worth
    @@all=[]
    def initialize(name,total_worth)
        @total_worth = total_worth
        @name =  name
        @@all << self
    end

    def self.all
        @@all
    end
    def self.tres_commas_club
        @@all.select do |venture_capitalist|
            venture_capitalist.total_worth.to_i >= 1000000000
        end
    end

    def offer_contract(startup,type,amount)
        FundingRound.new(startup,self,type,amount)
    end

    def funding_rounds
        FundingRound.all.select {|fundinground| fundinground.venture_capitalist == self}
    end

    def portfolio
        ar=[]
        FundingRound.all.each do |fundinground|
            if fundinground.venture_capitalist == self
                ar.push(fundinground.startup)
            end
        end
        ar.uniq
    end

    def biggest_investment
        
        FundingRound.all.select do |fundinground|
            fundinground.venture_capitalist == self
        end.max_by do |fundinground|
            fundinground.investment
        end
    end

    def invested(domain)
        total=0
        FundingRound.all.each do |fundinground| 
            if (fundinground.startup.domain == domain && fundinground.venture_capitalist == self)
                total += fundinground.investment
            end
        end
        return total
    end

end
