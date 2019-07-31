 def is_number?(side)
   side.to_f >=0 && (side.to_f.to_s == side || side.to_i.to_s == side)
 end

 def retry_gets_chomp(message, error_message)
   p message
   side = gets.chomp

   until is_number?(side)
 	 p error_message
 	 side = gets.chomp
   end
   side.to_f
 end

 a = retry_gets_chomp('Чему равна сторона треугольника?', 'Сторона треугольника должна быть положительным числом')
 h = retry_gets_chomp('Чему равна высота треугольника?', 'Высота треугольника должна быть положительным числом')
 
 p "Площадь данного треугольника = #{0.5*a*h}"