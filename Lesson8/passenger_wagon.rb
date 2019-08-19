# frozen_string_literal: true

class PassengerWagon < Wagon
  attr_reader :type, :seats
  def initialize(number, seats)
    super(number)
    @seats = {}
    (1..seats).each { |index| @seats[index] = false }
    @type = :passenger
  end

  def reserved?(number)
    @seats[number] == true
  end

  def book_seat(number)
    raise 'Нельзя занять место: Вагон еще не прицеплен к поезду' unless attached?

    raise 'Это место уже занято' if reserved?(number)

    @seats[number] = true
  end

  def free_seats_count
    @seats.count { |key, _| reserved?(key) == false }
  end

  def free_seats
    raise 'В этом вагоне нет свободных мест' if free_seats_count.zero?

    @seats.each_key { |key| puts key unless reserved?(key) }
  end

  def reserved_seats_count
    @seats.count - free_seats_count
  end
end
