# frozen_string_literal: true

class PassengerWagon < Wagon
  attr_reader :type, :seats
  def initialize(number, seats)
    super(number)
    @seats = { total: seats.to_i, free: seats.to_i }
    @type = :passenger
  end

  def reserved?(number)
    @seats[number] == true
  end

  def book_seat
    raise 'Нельзя занять место: Вагон еще не прицеплен к поезду' unless attached?

    raise 'Все места уже заняты' if free_seats_count.zero?

    @seats[:free] -= 1
  end

  def free_seats_count
    @seats[:free]
  end

  def reserved_seats_count
    @seats[:total] - free_seats_count
  end
end
