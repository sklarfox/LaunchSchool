require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(0)
  end

  def test_accept_money
    transaction = Transaction.new(50)
    transaction.amount_paid = 50
    @register.accept_money(transaction)
    assert_equal(50, @register.total_money)
  end

  def test_change
    transaction = Transaction.new(20)
    transaction.amount_paid = 50
    assert_equal(30, @register.change(transaction))
  end

  def test_give_receipt
    transaction = Transaction.new(20)
    output = "You've paid $20.\n"
    assert_output(output) { @register.give_receipt(transaction) }
  end
end