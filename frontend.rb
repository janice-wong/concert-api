require 'unirest'

@concerts = Unirest.get("localhost:3000/v1/concerts").body

# concerts.each do |concert|
#   p concert.name
# end

def print_all_concerts
  p "Here are all the concerts:"
  @concerts.each do |concert|
    p concert['name']
  end
end

def total_concert_cost
  total = 0
  @concerts.each do |concert|
    total += concert['cost']
  end
  "Concert costs total #{total.round(2)}"
  # can say return total but 'returns' are implicit in Ruby. this is not the case in other languages like JS
end

print_all_concerts
p '-' * 100
p total_concert_cost
