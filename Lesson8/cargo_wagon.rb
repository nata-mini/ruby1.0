# frozen_string_literal: true

class CargoWagon < Wagon
  attr_reader :type, :volume
  def initialize(number, volume)
    super(number)
    @volume = { general: volume.to_i, free: volume.to_i }
    @type = :cargo
  end

  def book_volume(volume)
    raise 'Недостаточно свободного места' if self.volume[:free] < volume
    self.volume[:free] -= volume
  end

  def free_volume
    volume[:free]
  end

  def reserved_volume
    volume[:general] - volume[:free]
  end
end
