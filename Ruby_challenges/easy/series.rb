=begin
Task: Given string of digits and specified length, find all possible consecutive number series of given length in the string
Rules:
  -consecutive digits means digits directly following one another
  -e.g. "01234" all 3-digit series:
    -012
    -123
    -234
  -e.g. "01234" all 4-digit series:
    -0123
    -1234
  -if asked for larger digit series than there are digits in the given string, throw an error

Examples/Test Cases:
  -define `Series` class
  -constructor method
    -takes one argument (string representing digits)
  -`slices` instance method
    -takes one argument (integer representing series size)
    -return nested array where each series is an array of integers nested within result array
    -raise `ArgumentError` if integer passed in is greater than length of string

Data structures:
  -strings
  -integers
  -arrays

Algorithm:
**`initialize` method:** - takes one argument (string `digits`)
-store `digits` in instance variable `@digits_str`

**`slices` instance method:** - takes one argument (integer `size`)
-raise `ArgumentError` if `size` > length of `@digits_str`

-break down `@digits_str` into array of individual characters - store in local variable `digits_arr`
-transform each string character in `digits_arr` into integers

-iterate from 0 to size of `digits_arr` - `size` with empty arrray object to store results - block parameters `index` and `result`
  -on each iteration:
    -reference section of `digits_arr` from `index` with size `size`, and append into `result`
-return `result` when finished iterating

=end

class Series
  def initialize(digits)
    @digits_str = digits
  end

  def slices(size)
    if size > @digits_str.length
      raise ArgumentError.new, "Must ask for series size smaller than string"
    end

    digits_arr = @digits_str.chars.map(&:to_i)

    (0..(digits_arr.size - size)).each_with_object([]) do |index, result|
      result << digits_arr[index, size]
    end
  end
end
