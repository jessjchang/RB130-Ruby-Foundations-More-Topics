require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(20)
  end

  def test_accept_money
    @transaction.amount_paid = 20
    previous_register_amount = @register.total_money
    @register.accept_money(@transaction)
    new_register_amount = @register.total_money

    assert_equal(previous_register_amount + 20, new_register_amount)
  end
end