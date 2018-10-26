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

end
