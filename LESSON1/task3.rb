def number?(side)
  side.to_f >= 0 && ([side.to_f.to_s, side.to_i.to_s].include? side)
end

def retry_gets_chomp(side)
  p "#{side} = "
  side = gets.chomp

  until number?(side)
    p 'Enter a non-negative number'
    side = gets.chomp
  end
  side.to_f
end

a = retry_gets_chomp('a')
b = retry_gets_chomp('b')
c = retry_gets_chomp('c')
side_array_sort = [a, b, c].sort

if [a, b, c].any?(&:zero?)
  p 'This is not a triangle. One or more sides are zero'
elsif a > b + c || b > a + c || c > a + b
  p 'Triangle does not exist'
elsif a == b && a == c
  p 'This triangle is equilateral'
elsif side_array_sort[2]**2 == side_array_sort[1]**2 + side_array_sort[0]**2
  p 'It is a right-angled triangle'
elsif side_array_sort.uniq.length != 3
  p 'It is an isosceles triangle'
else
  p 'It is not a right-angled, isosceles or equilateral triangle.'
end
