require 'pry'
require_relative 'funding_round'
require_relative 'startup'

class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {|investors| investors.total_worth >= 1000000000}
    end

    def offer_contract(startup, type_investment, amount_given)
        FundingRound.new(startup, self, type_investment, amount_given)
    end

    def funding_rounds
        FundingRound.all.select {|fundingrounds| fundingrounds.venture_capitalist == self}.length
    end

    def portfolio
        FundingRound.all.select do |fundingrounds| 
            fundingrounds.venture_capitalist == self
        end.map {|ventures| ventures.startup}.uniq
    end

    def biggest_investment
        temp = nil
        FundingRound.all.select do |fundingrounds|
            fundingrounds.venture_capitalist == self
        end.max_by {|fundinground| fundinground.investment}
    end

    def invested(domain_given)
        sum = 0.0
        FundingRound.all.each do |fundingrounds|
            if fundingrounds.startup.domain == domain_given
                sum += fundingrounds.investment
            end
        end
        sum
    end
end
