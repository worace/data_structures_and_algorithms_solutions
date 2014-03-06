gem 'minitest'
require 'minitest/autorun'
require_relative 'luhn_validator'

class LuhnTest < Minitest::Test
  # This test suite is not meant to be exhaustive,
  # just a start. Write your own tests!

  attr_reader :validator

  def setup
    @validator = LuhnValidator.new
  end

  def test_it_validates_the_example_account_number
    assert validator.validate('79927398713')
  end

  def test_it_finds_the_check_digit_for_an_identifier
    assert_equal '3', validator.check_digit_for('7992739871')
  end

  def test_it_comes_up_with_check_digit_for_a_single_digit
    assert_equal "4" , validator.check_digit_for('3')
  end

  def test_it_comes_up_with_check_digit_for_0
    assert_equal "0" , validator.check_digit_for('0')
  end

  def test_it_comes_up_with_check_digit_with_carry
    assert_equal '7', validator.check_digit_for('6')
  end

  def test_it_comes_up_with_check_digit_for_two_digits_without_carry
    assert_equal '4', validator.check_digit_for('22')
  end

  def test_it_validates_a_2_digit_example
    assert_equal true, validator.validate('18')
  end

  def test_it_invalidates_a_2_digit_example
    assert_equal false, validator.validate('19')
  end

  def test_it_validates_a_2_digit_example_with_a_carry
    assert_equal true, validator.validate('83')
  end

  def test_it_validates_a_3_digits_example_without_a_carry
    assert_equal true, validator.validate('117')
  end

  def test_it_validates_a_3_digit_example_with_a_carry
    assert_equal true, validator.validate('562')
  end

  def test_it_rejects_a_3_digit_example_thats_invalid
    assert_equal false, validator.validate('563')
  end

  def test_it_validates_a_4_digit_example_with_a_carry
    assert_equal true, validator.validate('4549')
  end

  def test_it_flips_and_intergerizes_an_account_number
    assert_equal [3, 2, 1], validator.digits_for('123')
  end

  def test_it_doubles_and_reduces_single_digits
    assert_equal 2, validator.double_reduce(1)
    assert_equal 4, validator.double_reduce(2)
    assert_equal 8, validator.double_reduce(4)
    assert_equal 1, validator.double_reduce(5)
    assert_equal 3, validator.double_reduce(6)
    assert_equal 9, validator.double_reduce(9)
  end
end
