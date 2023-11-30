class Train
    attr_accessor :destination, :train_number, :departure_time, :compartment_seats, :reserved_seats, :luxury_seats
    attr_reader :total_seats
  
    def initialize(destination, train_number, departure_time, compartment_seats, reserved_seats, luxury_seats)
      @destination = destination
      @train_number = train_number
      @departure_time = departure_time
      @compartment_seats = compartment_seats
      @reserved_seats = reserved_seats
      @luxury_seats = luxury_seats

      @total_seats = compartment_seats+reserved_seats+luxury_seats
    end

    def to_s
        "Номер: #{@train_number}\n Прямує: #{@destination}\n Відправлення: #{@departure_time} \n Кількість місць: #{@total_seats}"
    end
end

class TrainList
    def initialize(trains = [])
        @trains = trains
    end
  
    def add_train(train)
      @trains.append(train)
    end

    def trains_to_destination(destination)
        selected_trains = []
        @trains.each do |train|
          selected_trains.append(train) if train.destination == destination
        end
        return selected_trains
    end

    def trains_to_destination_after_time(destination, time)
        selected_trains = []
        @trains.each do |train|
          if train.destination == destination && train.departure_time > time
            selected_trains.append(train)
          end
        end
        selected_trains
    end

    def trains_to_destination_with_seats(destination)
        selected_trains = []
        @trains.each do |train|
          if train.destination == destination && train.luxury_seats != 0
            selected_trains.append(train)
          end
        end
        selected_trains
    end
end

require 'minitest/autorun'

class TestTrain < Minitest::Test
  def setup
    @train1 = Train.new("Dnipro", "12345", "08:00", 80, 100, 20)
    @train2 = Train.new("Kharkiv", "54321", "10:30", 60, 70, 10)
    @train3 = Train.new("Kyiv", "98765", "09:45", 70, 80, 15)
    @train4 = Train.new("Uzhhorod", "56789", "11:15", 90, 110, 25)
    @train5 = Train.new("Symu", "13579", "12:30", 65, 75, 12)
    @train6 = Train.new("Kyiv", "12345", "08:00", 80, 100, 0)
    @train7 = Train.new("Lviv", "54321", "10:30", 60, 70, 10)

    @list = TrainList.new([@train1, @train2, @train3, @train4, @train5, @train6, @train7])
  end

  def test_trains_to_destination_after_time
    selected_trains = @list.trains_to_destination_after_time("Kyiv", "09:00")
    assert_equal 1, selected_trains.length
    assert_equal [@train3], selected_trains
  end

  def test_trains_to_destination
    selected_trains = @list.trains_to_destination("Kyiv")
    assert_equal 2, selected_trains.length
    assert_equal [@train3, @train6], selected_trains
  end

  def test_trains_to_destination_with_seats
    selected_trains = @list.trains_to_destination("Lviv")
    assert_equal 1, selected_trains.length
    assert_equal [@train7], selected_trains
  end

  def test_trains_to_destination2
    selected_trains = @list.trains_to_destination("Uzhhorod")
    assert_equal 1, selected_trains.length
    assert_equal [@train4], selected_trains
  end

  def test_trains_to_destination_with_seats2
    selected_trains = @list.trains_to_destination("Symu")
    assert_equal 1, selected_trains.length
    assert_equal [@train5], selected_trains
  end

end

