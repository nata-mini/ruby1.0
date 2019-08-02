def price(hash, key)
  hash[key]['cost'] * hash[key]['count']
end

hash = {}

loop do
  p 'Enter product name'
  name = gets.chomp
  break if name.downcase == 'stop'

  p 'Cost = '
  cost = gets.chomp.to_f

  p 'Count = '
  count = gets.chomp.to_f

  hash[name] = { 'cost' => cost, 'count' => count }
end

p hash

hash.keys.each { |key| p "Total cost of #{key} is #{price(hash, key)}" }

amount = hash.keys.inject(0) { |sum, key| sum + price(hash, key) }
p "Total amount is #{amount}"
