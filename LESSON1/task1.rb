# frozen_string_literal: true

p 'What is your name?'
name = gets.chomp.capitalize
p 'How tall are you (in cm)?'

height = gets.chomp.to_f

while height <= 0
  p 'Please enter a positive number'
  height = gets.chomp.to_f
end

optimal_weight = height - 110

if optimal_weight.positive? && name.empty?
  p "Your ideal weight is #{optimal_weight}kg"
elsif optimal_weight.positive?
  p "#{name}, Your ideal weight is #{optimal_weight}kg"
else
  p 'Your weight is already optimal!'
end
