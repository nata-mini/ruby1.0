# frozen_string_literal: true

class PassengerTrain < Train
  # переопределяю метод приватный => тоже в приватных остается

  private

  def attach_wagon(wagon)
    super(wagon) if wagon.class == PassengerWagon
  end
end
