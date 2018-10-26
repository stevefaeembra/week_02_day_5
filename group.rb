class Group

  attr_reader :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def add_people(people_list)
    # add people, but ensure no-one added twice!
    return if !people_list.class == Array
    @members.concat people_list.uniq
  end

end
