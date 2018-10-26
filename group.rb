class Group

  attr_reader :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def add_people(people_list)
    # add people, but ensure no-one added twice!
    return if !people_list.class == Array
    people_list.each do |customer|
      @members << customer if !@members.include? customer
    end
  end

end
