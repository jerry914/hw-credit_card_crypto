module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    sum = double_alternating_digits(nums_a).sum

    sum % 10 == 0
  end

  def double_alternating_digits(nums_a)
    nums_a.reverse_each.with_index.map do |num, idx|
      idx.odd? ? (num * 2 > 9 ? num * 2 - 9 : num * 2) : num
    end
  end
end
