=begin
Task: Convert given octal input to a decimal number
Rules:
  -if given invalid octal input, treat it as octal 0
  -decimal base-10 system:
    -e.g. decimal number 233 = 2*10^2 + 3*10^1 + 3*10^0 = 233
  -octal base-8 system:
    -e.g. octal 233 = 2*8^2 + 3*8^1 + 3*8^0 = 155
  -invalid octal input:
    -contains letters
    -contains digits 8 or 9
  -octal input can be given with leading 0, and should be treated as valid e.g. 011 is same as 11

Examples/Test Cases:
  -define `Octal` class
  -constructor:
    -takes one argument, a string representing octal
  -define `to_decimal` instance method that converts octal from initialization (string) into decimal number (integer)
    -if octal is invalid, return 0

Data structures:
  -strings
  -integers
  -arrays

Algorithm:
`INITIALIZE` METHOD - takes one argument (string `octal`):
  -store `octal` in `@octal` instance variable for later use

`TO_DECIMAL` INSTANCE METHOD:
  -initialize constant `VALID_OCTAL_DIGITS` and assign to array of '0' to '9' not including '8' or '9'
  -break down `@octal` into array of individual characters - store in local variable `octal_digits`
  -initialize local variable `decimal` and assign to 0
  -return `decimal` unless `@octal` is valid - use `valid_octal?` helper method

  -iterate through `octal_digits` in reverse order with index - block parameters `digit` and `index`
    -on each iteration:
      -take 8 to power of index and multiply by `digit` (converted into integer)
      -append result to new array
  -once finished iterating, find sum of array and return result

`valid_octal?` helper method - take one argument, array `octal_digits`:
  -return true if all characters of `octal_digits` are included in `VALID_OCTAL_DIGITS`
  -return false otherwise
=end

class Octal
  VALID_OCTAL_DIGITS = ('0'..'7').to_a

  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    octal_digits = @octal.chars
    decimal = 0
    return decimal unless valid_octal?(octal_digits)

    octal_digits.reverse.map.with_index do |digit, index|
      8**index * digit.to_i
    end.sum
  end

  private

  def valid_octal?(octal_digits)
    octal_digits.all? { |digit| VALID_OCTAL_DIGITS.include?(digit) }
  end
end
