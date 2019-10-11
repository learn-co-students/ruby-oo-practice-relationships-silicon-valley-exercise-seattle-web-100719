require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
temp = Startup.new("flatiron", "edumacation", "avi")
temp2 = Startup.new("flat","sports", "duck")
temp3 = Startup.new("iron", "edumacation", "avi")
temp4 = VentureCapitalist.new("Bill Gates", 10000000000)
temp5 = VentureCapitalist.new("poor me", 100)
temp6 = VentureCapitalist.new("rich me", 1000000000)
temp7 = FundingRound.new(temp,temp4,"type C", 250.0)
temp8 = FundingRound.new(temp2,temp5, "type B", 3000.0)
temp9 = FundingRound.new(temp, temp6, "type poop", 30.0)
temp10 = FundingRound.new(temp2,temp4, "type C", 300)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line