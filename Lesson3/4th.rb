alphabet = ('a'..'z').to_a
vowels = %w[a e i o u]
hash = {}

alphabet.each.with_index { |letter, index| hash[letter.to_sym] = index + 1 if vowels.include? letter }

p hash
