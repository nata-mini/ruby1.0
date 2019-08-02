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
  months = { 'january': 31, 'february': 28, 'march': 31, 'april': 30,
             'may': 31, 'june': 30, 'july': 31, 'august': 31,
             'september': 30, 'october': 31, 'november': 30, 'december': 31 }

  days_in_month = months.values

  if month == 1
    0
  else
    days = days_in_month[0..month - 2].inject(0) { |sum, x| sum + x }
    days += 1 if leap_year?(year)
  end
end

p day + days_before_this_month(month, year)
