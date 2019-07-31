 def is_number?(side)
 	side.to_f >=0 && (side.to_f.to_s == side || side.to_i.to_s == side)
 end

 def retry_gets_chomp(side)
    p "#{side} = "
    side = gets.chomp

    until is_number?(side)
 	  p "Введите неотрицательное число"
 	  side = gets.chomp
    end
    side.to_f
 end

 a = retry_gets_chomp('a')
 b = retry_gets_chomp('b')
 c = retry_gets_chomp('c')
 side_array_sort = [a, b, c].sort

 if a == 0 || b == 0 || c == 0
 	p 'Это не треугольник. Одна или более сторон равны нулю'
 elsif a > b + c || b > a + c || c > a + b
 	p "Треугольник не существует"
 elsif a == b && a == c
 	p "Это равноcторонний треугольник"
 elsif side_array_sort[2]**2 == side_array_sort[1]**2 + side_array_sort[0]**2
 	p "Это прямоугольный треугольник"
 elsif side_array_sort.uniq.length != 3
 	p "Это равнобедренный треугольник"
 else
 	p "Треугольник не прямоугольный, не равнобедренный и не равносторонний"
 end