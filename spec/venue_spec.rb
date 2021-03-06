require("minitest/autorun")
require("minitest/rg")
require_relative("../venue")
require_relative("../room")
require_relative("../group")

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

  def test_get_room__price
    room1=Room.new("Kylie Minogue Room", 20)
    @venue.add_rooms([room1])
    cost = @venue.get_room_price(room1)
    assert_equal(200.0, cost)
  end

  def test_room__fill_with_group_can_afford
    room1=Room.new("Kylie Minogue Room", 20)
    @venue.add_rooms([room1])
    # make group of 20 with £15 each.
    group1 = make_test_group("TestGroup-20",20,15.0)
    @venue.add_group_to_room(group1,room1)
    assert_equal(group1.members, room1.customers)
    # all customers should now have 5.0 (20 person room=£200, £10 each)
    assert_equal(true, group1.members.all? {|p| p.funds==5.0})
    # venue should now have £1000+£200
    assert_equal(1200.0, @venue.takings)
  end

  def test_room__fill_with_group_cant_afford
    room1=Room.new("Kylie Minogue Room", 20)
    @venue.add_rooms([room1])
    # make group of 20 with £15 each.
    group1 = make_test_group("TestGroup-20-poor",20,5.0)
    assert_equal(false,@venue.add_group_to_room(group1,room1))
  end

  def test_room__fill_with_group_room__room_too_small
    room1=Room.new("Kylie Minogue Room", 10)
    @venue.add_rooms([room1])
    # make group of 20 with £15 each.
    group1 = make_test_group("TestGroup-20-poor",20,125.0)
    assert_equal(false,@venue.add_group_to_room(group1,room1))
    assert_equal(0, @venue.rooms[0].customers.length)
  end

end
