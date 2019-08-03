# frozen_string_literal: true

def leap_year?(year)
  (year % 400).zero? || ((year % 4).zero? && (year % 100) != 0)
end

p 'Enter the day of the month'
day = gets.chomp.to_i

p 'Enter month number'
month = gets.chomp.to_i

p 'Enter year'
year = gets.chomp.to_i

def days_before_this_month(month, year)
  days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  days_in_month[1] = 29 if leap_year?(year)

  if month == 1
    0
  else
    days_in_month.take(month - 1).sum
  end
end

p day + days_before_this_month(month, year)
