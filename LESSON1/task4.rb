  def is_number?(string)
    string.to_f.to_s == string || string.to_i.to_s == string
  end

 def retry_gets_chomp(string)
    p "#{string} = "
    string = gets.chomp

    until is_number?(string)
 	  p "Введите число"
 	  string = gets.chomp
    end
    string.to_f
 end

 a = retry_gets_chomp('a')
 b = retry_gets_chomp('b')
 c = retry_gets_chomp('c')

 D = b**2 - 4*a*c

 if D == 0
 	p "D = #{D}. Корень второй кратности = #{-b/(2*a)}"
 elsif D < 0
 	p "D = #{D}"
 	p 'Корней нет'
 else
 	p "D = #{D}"
 	p "x1 = #{(-b + Math.sqrt(D))/(2*a)}"
 	p "x1 = #{(-b - Math.sqrt(D))/(2*a)}"
 end