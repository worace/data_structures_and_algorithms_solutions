class LuhnValidator
  def validate(account)
    sum_double_reduce(digits_for(account)) % 10 == 0
  end

  def sum_double_reduce(digits)
    digits.map.with_index do |digit, i|
      if i.even?
        digit
      else
        double_reduce digit
      end
    end.reduce(:+)
  end

  def check_digit_for(account)
    padded_account = account + "0"
    offset = sum_double_reduce(digits_for(padded_account))
    ((10 - offset) % 10).to_s
  end

  def digits_for(account)
    account.reverse.chars.map(&:to_i)
  end

  def double_reduce(digit)
    double = digit * 2
    digits_for(double.to_s).reduce(:+)
  end
end
