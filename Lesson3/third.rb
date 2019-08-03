# frozen_string_literal: true

array = [0, 1]

array << @next_el while (@next_el = array[-1] + array[-2]) <= 100
p array
