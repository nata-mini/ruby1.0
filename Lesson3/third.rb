# frozen_string_literal: true

array = [0, 1]

while (next_el = array[-1] + array[-2]) <= 100
  array << next_el
end

p array
