require 'pry'
require_relative 'funding_round'
require_relative 'venture_capitalist'

class Startup

    attr_reader :name, :domain, :founder

    @@all = []

    def initialize(name, domain, founder)
        @name = name
        @domain = domain
        @founder = founder
        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(newDomain, newName)
        @name = newName
        @domain = newDomain
    end

    def self.domains
        @@all.map {|startup| startup.domain}.uniq
    end

    def self.find_by_founder(founderGiven)
        self.all.detect {|startup| startup.founder == founderGiven}
    end

    def sign_contract(capitalist, type_investment, amount_given)
        FundingRound.new(self, capitalist,type_investment, amount_given)
    end

    def num_funding_rounds
        FundingRound.all.select {|fundingrounds| fundingrounds.startup == self}.length
    end

    def total_funds
        sum = 0.0
        FundingRound.all.each do |fundingrounds| 
            if fundingrounds.startup == self
                sum += fundingrounds.investment
            end
        end
        sum
    end

    def investors
        FundingRound.all.select do |fundingrounds| 
            fundingrounds.startup == self
        end.map {|startups| startups.venture_capitalist}.uniq
    end

    def big_investors
        self.investors.select do |investor|
            VentureCapitalist.tres_commas_club.include?(investor)
        end
    end

end
