require("minitest/autorun")
require("minitest/rg")
require_relative("../group")
require_relative("../customer")

class TestGroup < MiniTest::Test

  def setup
    @group = Group.new("Jane's Hen Do 2018")
  end

  def test_starts_with_no_members
    assert_equal(Group,@group.class)
    assert_equal([], @group.members)
  end

  def test_add_people
    person1 = Customer.new("Jane","It's Raining Men",20.0)
    person2 = Customer.new("Rod","Tubby Ducky Song",50.0)
    person3 = Customer.new("Freddy","I will Survive", 40.0)
    person4 = Customer.new("Lesley", "My way", 100.0)
    person5 = Customer.new("Christine", "Shuddupa ya Face", 51.0)
    group_members = [person1,person2,person3,person4,person5]
    @group.add_people(group_members)
    assert_equal(group_members, @group.members)
  end

  def test_add_people__no_duplicates
    person1 = Customer.new("Jane","It's Raining Men",20.0)
    person2 = Customer.new("Rod","Rubber Ducky Song",50.0)
    person3 = Customer.new("Freddy","I will Survive", 40.0)
    person4 = Customer.new("Lesley", "My way", 100.0)
    person5 = Customer.new("Christine", "Shuddupa ya Face", 51.0)
    group_members = [person1,person2,person2,person3,person3,person4,person3,person5]
    no_dupes = [person1,person2,person3,person4,person5]
    @group.add_people(group_members)
    assert_equal(no_dupes, @group.members)
  end

  def test_group__make_test_group
    group = make_test_group("Test Group",10,20.0)
    assert_equal(Group, group.class)
  end

  def test_group_make_test_group__funds_set
    group = make_test_group("Test Group",10,20.0)
    assert_equal(true, group.members.all? {|person| person.funds==20.0})
  end

  def test_group_make_test_group__get_total_funds
    group = make_test_group("Test Group",10,20.0)
    assert_equal(200.0, group.get_total_funds)
  end


end
