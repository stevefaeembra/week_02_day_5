require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../customer")

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

  def test_room__has_no_customers
    assert_equal([], @room.customers)
  end

  def test_room__can_add_customer
    customer = Customer.new("John Doe", "I feel love", 100.0)
    @room.add_customer(customer)
    assert_equal(1, @room.customers.length)
    assert_equal(customer, @room.customers[0])
  end
end
