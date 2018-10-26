class Venue

  attr_reader :name, :takings

  def initialize(name, takings)
    @name = name
    @takings = takings
    @rooms = []
  end

  def increase_takings(amount)
    @takings += amount
  end

end
