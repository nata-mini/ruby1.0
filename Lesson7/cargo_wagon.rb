# frozen_string_literal: true

class CargoWagon < Wagon
  attr_reader :type
  def initialize(number)
    super(number)
    @type = :cargo
  end
end
