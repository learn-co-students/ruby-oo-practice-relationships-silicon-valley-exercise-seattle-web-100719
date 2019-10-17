require 'pry'

class Startup

    attr_accessor :name, :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self 
    end

    def pivot(new_domain, new_name)
        self.domain = new_domain
        self.name = new_name
    end 

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name) 
        Startup.all.each do |startup|
        # if founder_info.founder == self 
        # return founder_info.name

        if startup.founder == founder_name
            return startup
        end
        end 
    end 

    binding.pry
end
