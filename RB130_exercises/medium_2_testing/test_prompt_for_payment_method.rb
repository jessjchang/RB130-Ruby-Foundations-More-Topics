require 'minitest/autorun'

require_relative 'transaction_2'

class TransactionTest < MiniTest::Test
  def setup
    @transaction = Transaction.new(20)
  end

  def test_prompt_for_payment
    input = StringIO.new("20\n")
    @transaction.prompt_for_payment(input: input)
    assert_equal(20, @transaction.amount_paid)
  end
end