require_relative('playlist')

class Room

  attr_reader :name, :capacity, :playlist

  def initialize(room_name, capacity)
    @name = room_name
    @capacity = capacity
    @playlist = Playlist.new()
  end

end
