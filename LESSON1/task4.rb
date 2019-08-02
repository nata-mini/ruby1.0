def number?(string)
  [string.to_f.to_s, string.to_i.to_s].include? string
end

def retry_gets_chomp(string)
  p "#{string} = "
  string = gets.chomp

  until number?(string)
    p 'Enter a number'
    string = gets.chomp
  end
  string.to_f
end

a = retry_gets_chomp('a')
b = retry_gets_chomp('b')
c = retry_gets_chomp('c')

D = b**2 - 4 * a * c

if D.zero?
  p "Discriminant = #{D}", "x1 = x2 = #{-b / (2 * a)}"
elsif D < 0
  p "Discriminant = #{D}", 'There are no roots'
else
  sqrt_of_disc = Math.sqrt(D)
  p "Discriminant = #{D}"
  p "x1 = #{(-b + sqrt_of_disc) / (2 * a)}"
  p "x1 = #{(-b - sqrt_of_disc) / (2 * a)}"
end
