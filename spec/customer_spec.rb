require("minitest/autorun")
require("minitest/rg")
require_relative("../customer")

class TestCustomer < MiniTest::Test

  def setup
    @customer = Customer.new("Steven", "I will Survive", 50.0)
  end

  def test_one
    assert_equal(Customer, @customer.class)
  end

  def test_name
    assert_equal("Steven", @customer.name)
  end

  def test_fave
    assert_equal("I will Survive", @customer.favourite_song)
  end

  def test_withdraw_funds__sufficient_funds
    result = @customer.pay_money(30.0)
    assert_equal(20.0, @customer.funds)
    assert_equal(true, result)
  end

  def test_withdraw_funds__insufficient_funds
    result = @customer.pay_money(60.0)
    assert_equal(50.0, @customer.funds)
    assert_equal(false, result)
  end

end
