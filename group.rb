require_relative('customer')

class Group

  attr_reader :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def add_people(people_list)
    # add people, but ensure no-one added twice!
    @members.concat(people_list.uniq) if people_list.class == Array
  end

  def get_total_funds()
    sum = @members.reduce(0) do |sum, p|
      sum + p.funds
    end
    sum
  end

end

# utility method to make a group of a specific size and
# initial funds per person. outside class as i can't work
# out how to get class methods to work

def make_test_group(name_of_group, size_of_group, funds_per_person=50.0)
  peeps = []
  for index in 1..size_of_group
    peeps << Customer.new("Person#{index}","",funds_per_person)
  end
  group = Group.new(name_of_group)
  group.add_people(peeps)
  return group
end
