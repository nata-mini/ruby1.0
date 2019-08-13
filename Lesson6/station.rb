# frozen_string_literal: true

require_relative 'instance_count'

class Station
  include InstanceCount
  @@stations = []

  def self.all
    @@stations
  end
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
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
end
