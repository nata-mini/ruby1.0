def what_is_your_weight
  p "Как Вас зовут?"
  name = gets.chomp.capitalize
  p "Чему равен Ваш рост (в см)?"

  height = gets.chomp.to_f

  while height <= 0 
	p 'Для вычисления оптимального веса, пожалуйста, введите положительное число'
	height = gets.chomp.to_f
  end

  optimal_weight = height - 110

  if optimal_weight > 0 && name.empty?
    p "Ваш идельный вес равен #{optimal_weight}кг"
  elsif optimal_weight > 0
    p "#{name}, Ваш идельный вес равен #{optimal_weight}кг"
  else
    p 'Ваш вес уже оптимальный!'
  end
end

