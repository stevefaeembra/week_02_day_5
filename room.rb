require_relative('playlist')

class Room

  attr_reader :name, :capacity, :playlist, :customers

  def initialize(room_name, capacity)
    @name = room_name
    @capacity = capacity
    @playlist = Playlist.new()
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

end
