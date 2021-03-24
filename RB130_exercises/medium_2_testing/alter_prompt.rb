require 'minitest/autorun'

require_relative 'transaction_3'

class TransactionTest < MiniTest::Test
  def setup
    @transaction = Transaction.new(20)
  end

  def test_prompt_for_payment
    input = StringIO.new("20\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(20, @transaction.amount_paid)
  end
end

# Alternate Test

require 'minitest/autorun'

require_relative 'transaction_2'

class TransactionTest < MiniTest::Test
  def setup
    @transaction = Transaction.new(20)
  end

  def test_prompt_for_payment
    input = StringIO.new("10\n20\n")
    expected_output = <<-OUTPUT.gsub /^\s+/, ""
    You owe $20.
    How much are you paying?
    That is not the correct amount. Please make sure to pay the full cost.
    You owe $20.
    How much are you paying?
    OUTPUT

    assert_output(expected_output) { @transaction.prompt_for_payment(input: input) }
    assert_equal(20, @transaction.amount_paid)
  end
end
