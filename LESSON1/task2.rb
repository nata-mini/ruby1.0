def number?(side)
  side.to_f >= 0 && ([side.to_f.to_s, side.to_i.to_s].include? side)
end

def retry_gets_chomp(message)
  p message
  side = gets.chomp

  until number?(side)
    p 'The sides of the triangle can only be a positive number'
    side = gets.chomp
  end
  side.to_f
end

a = retry_gets_chomp('What is the side of the triangle?')
h = retry_gets_chomp('What is the height of the triangle?')
p "The area of this triangle is #{0.5 * a * h}"
