# frozen_string_literal: true

alphabet = ('a'..'z')
vowels = %w[a e i o u]
hash = {}

alphabet.each.with_index(1) { |letter, index| hash[letter.to_sym] = index if vowels.include? letter }

p hash
