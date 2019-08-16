# frozen_string_literal: true

class PassengerWagon < Wagon
  attr_reader :type
  def initialize(number)
    super(number)
    @type = :passenger
  end
end
