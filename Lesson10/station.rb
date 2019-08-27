# frozen_string_literal: true

require_relative 'validator'
require_relative 'accessors'

class Station
  include Validator
  extend Accessors

  STATION_NAME_FORMAT = /^\w+$/.freeze
  @stations = []
  class << self
    attr_accessor :stations
    alias all stations
  end

  attr_accessor_with_history :name, :trains
  validate :name, :format, STATION_NAME_FORMAT

  def initialize(name)
    @name = name
    @trains = []
    validate!
    self.class.stations << self
  end

  def each_train
    raise 'На станции нет поездов' if trains.empty?

    trains.each { |train| yield train }
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
end
