array = []
(10..100).each { |i| array << i if (i % 5).zero? }
p array
