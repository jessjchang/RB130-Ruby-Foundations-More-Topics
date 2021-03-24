=begin
Task: Determine if given number is perfect, abundant, or deficient
Rules:
  -Aliquot sum = sum of number's divisors (1 is included, but not number itself)
  -perfect: Aliquot sum is equal to number
  -abundant: Aliquot sum is greater than number
  -deficient:
    -Aliquot sum is less than number
    -prime numbers are always deficient
  -natural numbers only(positive integer starting from 1)

Examples/Test Cases:
  -define `PerfectNumber` class
  -define `classify` class method that takes integer as argument and returns whether it is perfect, abundant, or deficient (as string)
    -raise `StandardError` if pass in non-natural number to `classify` as argument

Data structures:
  -integers
  -strings

Algorithm:
`CLASSIFY` CLASS METHOD - takes one argument (integer `num`):
  -raise `StandardError` if `num` is < 1
  -use `find_aliquot_sum` helper method to return Aliquot sum of `num` - store in local variable `aliquot_sum`
  -check `aliquot_sum`
    -if > `num`, return 'abundant'
    -if < `num`, return 'deficient'
    -otherwise return 'perfect'

`find_aliquot_sum` helper method (class method) - takes one argument (integer `num`):
  -use `find_divisors` helper method to return array of divisors of `num`, and sum 

`find_divisors` helper method (class method) - takes one argument (integer `num`):
  -iterate from 1 up to but not including `num` - block parameter `current_num`
    -on each iteration, append into array if `current_num` is divisor of `num` (i.e. `num` % `current_num` is equal to 0)
  -return resulting array
=end

class PerfectNumber
  def self.classify(num)
    raise StandardError.new, "Must be natural number" if num < 1
    aliquot_sum = find_aliquot_sum(num)

    if aliquot_sum > num
      'abundant'
    elsif aliquot_sum < num
      'deficient'
    else
      'perfect'
    end
  end

  class << self
    private

    def find_aliquot_sum(num)
      find_divisors(num).sum
    end

    def find_divisors(num)
      (1...num).select { |current_num| num % current_num == 0 }
    end
  end
end
