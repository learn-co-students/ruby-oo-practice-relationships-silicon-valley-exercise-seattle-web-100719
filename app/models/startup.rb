class Startup
    #attr_accessor :name
    attr_reader :founder, :name, :domain
    @@all=[]
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end
    def pivot(domain,name)
        @name=name
        @domain=domain
        nil
    end
    
    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        @@all.find do |startup|
            startup.founder == founder_name
        end
    end

    def self.domains
        @@all.map{|startup| startup.domain}
    end

    def sign_contract(venture_capitalist,type,amount)
        FundingRound.new(self,venture_capitalist,type,amount)
    end

    def num_funding_rounds
        FundingRound.all.select {|f_r| f_r.startup == self}.count
    end

    def total_funds
        total
        FundingRound.all.each do |f_r|
            if f_r.startup == self
                total += f_r.investment
            end
        end
        total
    end

    def investors
        ar=[]
        FundingRound.all.each do |f_r|
            if f_r.startup == self
                ar.push(f_r.venture_capitalist)
            end
        end
        ar.uniq
    end

    def big_investors
        investors.select do |investor|
             VentureCapitalist.tres_commas_club.include?(investor)
        end.uniq
    end


end
