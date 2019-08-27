# frozen_string_literal: true

module Validator
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
  module ClassMethods
    attr_accessor :vals

    def validate(name, validation, rule = nil)
      val =  [] || instance_variable_get(:@vals)
      val << ["@#{name}".to_sym, validation, rule]
      instance_variable_set(:@vals, val)
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue RuntimeError => e
      puts e.message
      false
    end

    def validate!
      self.class.vals.each { |val| validate_method(val) }
    end

    def validate_method(val)
      name, validation, rule = val
      var_name = instance_variable_get(name)
      send(validation.to_s, name, var_name, rule)
    end

    def presence(name, var_name, *)
      raise "#{name} empty or nil" if var_name.to_s.strip == ''
    end

    def format(name, var_name, rule)
      raise "Wrong #{name} format" if var_name !~ rule
    end

    def type(name, var_name, rule)
      raise "Wrong #{name} class" unless var_name.is_a?(rule)
    end
  end
end
