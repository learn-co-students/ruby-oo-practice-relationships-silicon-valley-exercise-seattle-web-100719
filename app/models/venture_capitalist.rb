
require 'pry'

class VentureCapitalist

    attr_accessor :name, :total_worth
    @@all = []

    def initialize(name, total_worth=0)
        @name = name
        @total_worth = total_worth
        @@all << self 

    end 

    def self.all
        @@all
    end 

    def self.tres_commas_club
        new_array = []
        VentureCapitalist.all.each do |person|
            if person.total_worth > 1000000000 
                new_array << person.name 
            end
        new_array
        end 
    end 
    

    def bark
        puts "bark"
        puts self
    end

    def self.bigBark
        puts "boof"
        self
    end

    binding.pry
end
