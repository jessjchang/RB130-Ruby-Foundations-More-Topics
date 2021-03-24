=begin
Task: convert number into roman numerals
Rules:
  -1: I
  -4: IV
  -5: V
  -9: IX
  -10: X
  -40: XL
  -50: L
  -90: XC
  -100: C
  -400: CD
  -500: D
  -900: CM
  -1000: M
  -no need to convert numbers > 3000
  -digits written starting left to right, skipping any digit with value of 0
  -Examples:
    -1990: MCMXC
      -1000: M
      -900: CM
      -90: XC
      -0: skip
    -2008: MMVIII
      -2000: MM
      -000: skip
      -00: skip
      -8: VIII

Examples/Test Cases:
  -define `RomanNumeral` class
  -constructor takes one argument, an integer which represents the number
    -don't need to validate argument or raise error in any cases
  -define `to_roman` instance method
    -convert the number into roman numerals (a string)
    -can convert from 1 to 3000

Data Structures:
-integers
-strings
-hash

Brainstorm/Initial Approach:

#1:
-hash to store the key roman numerals and corresponding values
-use empty string to store resulting roman numeral
-iterate through the roman numeral array and compare to number given, adding to the string

#2:
-multiple iterations e.g. a loop of some sort
-divide down the number given
-use remainder for next number

Algorithm:
`INITIALIZE` METHOD:
-takes integer as argument
-store argument in instance variable `@number` for later use

`TO_ROMAN` METHOD:
-create constant `ROMAN_NUMERALS` to store roman numerals and corresponding values in descending order of value
-initialize local variable `result` to empty string
-initialize local variable `current_num` and assign to `@number`
-initialize local variable `roman_chars`
-create array of only keys from `ROMAN_NUMERALS` and sort in descending order of value, and store this array in `roman_chars`
-iterate through `roman_chars`
  -on each iteration:
    -`value` is value of current `char`
    -check if `value` is <= `current_num`
      -if so:
        -initialize local variable `multiplier` to `current_num` / `value`
        -multiply current roman numeral character `char` by `multiplier`, and append to `result`
        -subtract the `value` * `multiplier` from `current_num` and reassign `current_num` to this return value
      -otherwise:
        -move onto next iteration 
-return `result`
=end

class RomanNumeral
  ROMAN_NUMERALS = {
    'M' => 1000,
    'CM' => 900,
    'D' => 500,
    'CD' => 400,
    'C' => 100,
    'XC' => 90,
    'L' => 50,
    'XL' => 40,
    'X' => 10,
    'IX' => 9,
    'V' => 5,
    'IV' => 4,
    'I' => 1
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_chars = reverse_roman_numeral_values

    perform_iteration(roman_chars)
  end

  private

  def reverse_roman_numeral_values
    ROMAN_NUMERALS.keys.sort_by do |char|
      ROMAN_NUMERALS[char]
    end.reverse
  end

  def adjust_result_and_current_num(current_num, char, result)
    value = ROMAN_NUMERALS[char]
    if value <= current_num
      multiplier = current_num / value
      result << char * multiplier
      current_num -= value * multiplier
    end

    current_num
  end

  def perform_iteration(roman_chars)
    result = ''
    current_num = @number

    roman_chars.each do |char|
      current_num = adjust_result_and_current_num(current_num, char, result)
    end

    result
  end
end
