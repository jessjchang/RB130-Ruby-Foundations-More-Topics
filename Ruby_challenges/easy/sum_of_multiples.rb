=begin
Task: Given a natural number and a set of one or more other numbers, find sum of all multiples of numbers in set that are less than given number
Rules:
  -if not given set of numbers, use default set of 3 and 5
  -natural numbers are positive integers
  -if a number is multiple of multiple numbers in given set, only include once (i.e. don't count duplicates)
  -e.g. given 20 and set of 3 and 5:
    -all natural numbers that are multiples of 3 and 5 up to but not including 20:
      -3, 5, 6, 9, 10, 12, 15, and 18 - sum is 78

Examples/Test Cases:
  -define `SumOfMultiples` class
  -define `to` class method that takes one argument (an integer)
    -default set to use is [3, 5]
    -if given number is 1 and default set is 3 and 5, then return 0
    -returns sum of multiples of set up to given integer
  -define constructor:
    -takes one or more arguments representing set (integers)
    -don't need to raise error
  -define `to` instance method:
    -takes one argument (integer)
    -returns sum of multiples of set up to given integer

Data structures:
  -integers
  -arrays

Brainstorm/Initial Approach:
#1:
-iterate through `@set` - block parameter `set_num`
  -on each iteration:
    -find multiples up to `num` of current `set_num` (use `find_multiples` helper method) and append into new array
-once finished iterating, flatten the resulting array into a one-dimensional array
-break down the array into unique values
-find sum of the array

`find_multiples` helper method - takes two arguments (integers `num` and `set_num`):
-initialize local variable `multiples` to empty array
-initialize local variable `multiplier` to 1 
-create a loop - while `multiplier` * `set_num` < `num`:
  -append `multiplier` * `set_num` into `multiples` array
-return `multiples`

#2:
-use counter initialized to 0
-iterate from smallest set number up to the given number and increment counter by multiples

Algorithm:
`INITIALIZE` METHOD - take one or more arguments (integers `*set_nums`):
  -store arguments as array in `@set` instance variable

`TO` INSTANCE METHOD - takes one argument (integer `num`):
-sort `@set` in ascending numerical value and store in local variable `sorted_set`
-initialize local variable `sum` to 0
-iterate from first element of `sorted_set` up to but not including `num` - block parameter `current_num`
  -on each iteration:
    -check if `current_num` is a multiple of any elements of `sorted_set`
      -if so, increment `sum` by `current_num`
      -otherwise, move onto next iteration
-once finished iterating, return `sum`

`TO` CLASS METHOD - takes one argument (integer `num`):
  -instantiate new `SumOfMultiples` object, passing in 3 and 5 into `new` method
  -invoke `to` instance method on this new object, passing in `num` as argument
=end

class SumOfMultiples
  def self.to(num)
    SumOfMultiples.new(3, 5).to(num)
  end

  def initialize(*set_nums)
    @set = set_nums
  end

  def to(num)
    sorted_set = @set.sort
    sum = 0

    (sorted_set.first...num).each do |current_num|
      sum += current_num if sorted_set.any? do |set_num|
        current_num % set_num == 0
      end
    end

    sum
  end
end
