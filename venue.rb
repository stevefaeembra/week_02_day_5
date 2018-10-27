class Venue

  attr_reader :name, :takings, :rooms

  def initialize(name, takings)
    @name = name
    @takings = takings
    @rooms = []
  end

  def increase_takings(amount)
    @takings += amount
  end

  def add_rooms(room_list)
    @rooms.concat(room_list)
  end
end
