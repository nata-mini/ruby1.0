# frozen_string_literal: true

require_relative 'validator'
require_relative 'accessors'

class Train
  include Validator
  extend Accessors

  TRAIN_NUMBER_FORMAT = /^[а-яa-z\d]{3}-?[а-яa-z\d]{2}$/i.freeze

  @trains = {}
  class << self
    attr_accessor :trains
    def find(number)
      @trains[number]
    end
  end

  attr_accessor_with_history :number
  attr_reader :current_station, :speed, :wagons, :route

  validate :number, :format, TRAIN_NUMBER_FORMAT

  def initialize(number)
    @number = number.to_s
    @wagons = []
    @speed = 0
    validate!
    self.class.trains[number] = self
  end

  def each_wagon
    raise 'No wagons attached' if @wagons.empty?

    @wagons.each { |wagon| yield(wagon) }
  end

  def stop
    @speed = 0
  end

  def stopped?
    @speed.zero?
  end

  def increase_speed(speed)
    @speed += speed if speed.positive?
  end

  def attach_wagon!(wagon)
    raise 'Error: Wait for the train to stop' unless stopped?

    attach_wagon(wagon)
  end

  def detach_wagon!(wagon)
    raise 'Error: Wait for the train to stop' unless stopped?

    detach_wagon(wagon)
  end

  def take_route(route)
    @route = route.route
    @current_station = @route[0]
    @current_station.take_train(self)
  end

  def next_station?
    raise 'The train has no route' unless @current_station
    raise 'The current station is the last' if @current_station == @route.last

    true
  end

  def go_to_next
    next_station?
    @current_station.send_train(self)
    @current_station = @route[@route.index(@current_station) + 1]
    @current_station.take_train(self)
  end

  def previous_station?
    raise 'The train has no route' unless @current_station
    raise 'The current station is the first' if @current_station == @route.first

    true
  end

  def go_to_previous
    previous_station?
    @current_station.send_train(self)
    @current_station = @route[@route.index(@current_station) - 1]
    @current_station.take_train(self)
  end

  def next_station
    has_next_station?
  end

  def previous_station
    has_previous_station?
  end

  private

  attr_writer :route
  def attach_wagon(wagon)
    @wagons << wagon
    wagon.attach_to_train(self)
  end

  def detach_wagon(wagon)
    raise 'The wagon is not attached to the train' unless wagons.include? wagon

    @wagons.delete(wagon)
    wagon.detach_from_train(self)
  end
end
