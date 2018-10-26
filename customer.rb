class Customer

  attr_reader :name, :favourite_song, :funds

  def initialize(name, favourite_song, funds)
    @name = name
    @favourite_song = favourite_song
    @funds = funds
  end

  def pay_money(amount)
    return false if amount > @funds
    @funds -= amount
    true
  end

end
