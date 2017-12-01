require 'unirest'
require 'tty-prompt'

@concerts = Unirest.get("localhost:3000/v1/concerts").body

# concerts.each do |concert|
#   p concert.name
# end

# def print_all_concerts
#   p "Here are all the concerts:"
#   @concerts.each do |concert|
#     p concert['name']
#   end
# end

# def total_concert_cost
#   total = 0
#   @concerts.each do |concert|
#     total += concert['cost']
#   end
#   "Concert costs total #{total.round(2)}"
#   # can say return total but 'returns' are implicit in Ruby. this is not the case in other languages like JS
# end

# def fancy_total_concert_cost
#   total = @concerts.inject(0) { |sum, concert| sum + concert['cost'] }
#   "Concert costs total #{total.round(2)}"
# end

# print_all_concerts
# p '-' * 100
# p total_concert_cost
# p '-' * 100
# p fancy_total_concert_cost

def concert_names
  @concerts.map { |concert| concert['name'] }
end

prompt = TTY::Prompt.new
prompt.multi_select("Select concerts:", concert_names)
