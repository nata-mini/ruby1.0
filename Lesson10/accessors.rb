module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      history = "@#{name}_history".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}_history".to_sym) { instance_variable_get(history) || [] }
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        history_temp = if instance_variable_get(history)
                         instance_variable_get(history) << value
                       else
                         [value]
                       end
        instance_variable_set(history, history_temp)
      end
    end
  end

  def strong_attr_accessor(name, type)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=") do |value|
      raise 'Wrong value type' unless value.is_a?(type)

      instance_variable_set(var_name, value)
    end
  end
end
