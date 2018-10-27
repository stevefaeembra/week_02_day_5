require("minitest/autorun")
require("minitest/rg")
require_relative("../venue")
require_relative("../room")

class TestVenue < MiniTest::Test

  def setup
    @venue = Venue.new("The Hairbrush and Mirror", 1000.0)
  end

  def test_venue__exists
    assert_equal(Venue,@venue.class)
  end

  def test_venue__takings_start_value
    skip "Venue.Takings made private, skipping"
    assert_equal(1000.0, @venue.takings)
  end

  def test_venue__name_set
    assert_equal("The Hairbrush and Mirror", @venue.name)
  end

  def test_venue__no_rooms
    skip "Venue.Rooms made private, skipping"
    assert_equal([], @venue.rooms)
  end

  def test_venue__add_rooms
    room1=Room.new("Kylie Minogue Room", 20)
    room2=Room.new("Come on Barbie lets go party",15)
    room3=Room.new("Crooner Classics",10)
    room4=Room.new("Spice Girls Room",12)
    rooms=[room1,room2,room3,room4]
    @venue.add_rooms(rooms)
    assert_equal(rooms, @venue.rooms)
  end

  def test_venue__takings_go_up
    skip "Venue.takings made private, skipping"
    @venue.increase_takings(140.0)
    assert_equal(1140.0, @venue.takings)
  end

end
