# frozen_string_literal: true

require_relative 'instance_count'

class Station
  include InstanceCount

  STATION_NAME_FORMAT = /^\w+$/
  @@stations = []

  def self.all
    @@stations
  end
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
    register_instance
  end

  def take_train(train)
    @trains << train if train.current_station == self
  end

  def trains_count(type)
    @trains.count { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)
  end

  def validate!
    raise 'Неверный формат названия станции' if @name !~ STATION_NAME_FORMAT
    raise 'Название станции должно содержать минимум два символа' if @name.length < 2
  end
end
