# frozen_string_literal: true

def price(hash, key)
  hash[key][:price] * hash[key][:count]
end

hash = {}

loop do
  puts 'Enter product name'
  name = gets.chomp
  break if name.downcase == 'stop'

  puts 'Price = '
  cost = gets.chomp.to_f

  puts 'Count = '
  count = gets.chomp.to_f

  hash[name] = { price: cost, count: count }
end

puts hash

hash.keys.each { |key| puts "Total cost of #{key} is #{price(hash, key)}" }

amount = hash.keys.inject(0) { |sum, key| sum + price(hash, key) }
p "Total amount is #{amount}"
