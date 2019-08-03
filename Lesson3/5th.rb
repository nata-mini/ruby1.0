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

  if month == 1
    0
  else
    days = days_in_month[0..month - 2].sum
    days += 1 if leap_year?(year) && month != 2
    days
  end
end

p day + days_before_this_month(month, year)
