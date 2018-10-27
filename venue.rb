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

  def get_room_price(room)
    return if not @rooms.member? room
    return 10.0 * room.capacity
  end

  def add_group_to_room(group, room)
    # return if room is nil or not in the venue
    return false if !rooms.member? room
    # need to make sure room is big enough
    return false if room.capacity < group.members.length
    # need to check group has sufficient funds
    price = get_room_price(room)
    funds = group.get_total_funds()
    return false if funds<price
    # check all individuals have enough money to get in.
    price_per_person = price.to_f / group.members.count.to_f
    return false if not group.members.all? {|person| person.funds >= price_per_person}
    # finally we can shovel them in!
    group.members.each do |person|
      room.add_customer(person)
      person.pay_money(price_per_person)
      increase_takings(price_per_person)
    end
  end
end
