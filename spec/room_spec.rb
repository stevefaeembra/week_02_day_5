require("minitest/autorun")
require("minitest/rg")
require_relative("../room")

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new("Jungle Room",25)
  end

  def test_room
    assert_equal(Room, @room.class)
  end

  def test_room__name
    assert_equal("Jungle Room", @room.name)
  end

  def test_room__capacity
    assert_equal(25, @room.capacity)
  end

  def test_room__has_playlist
    assert_equal(Playlist, @room.playlist.class)
    assert_equal([], @room.playlist.songs)
  end
end
