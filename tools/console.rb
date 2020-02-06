require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

sup1 = Startup.new("DEWUEVEN", "Shawn", "Passive Aggressiveness")

vc1 = VentureCapitalist.new("Shawn", 1200000000)

sup1.pivot("Sports", "ESPN")

sup1.sign_contract(vc1, "purple dubs", 4000000000000)

puts sup1.num_funding_rounds

sup2 = Startup.new("Bus Stop Alarm Clock", "Matt", "Fall asleep on the bus? No problem!")

vc2 = VentureCapitalist.new("Matt", 2400000000)

sup2.sign_contract(vc2, "gold dawgs", 8000000000000)

sup2.sign_contract(vc2, "TEST 2", 83)

puts sup2.num_funding_rounds


# binding.pry
#0 #leave this here to ensure binding.pry isn't the last line