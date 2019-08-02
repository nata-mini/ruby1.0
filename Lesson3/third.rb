array = [0, 1]

array << array[-1] + array[-2] while (array[-1] + array[-2]) <= 100
p array
