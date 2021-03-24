=begin
Task: given a letter, return a string representing a diamond shape (formed by letters) where given letter is at widest point
Rules:
  -diamond starts with 'A' e.g. if given 'A', return 'A'
  -first row: 1 'A'
  -last row: 1 'A'
  -all rows except first and last have 2 identical letters
  -diamond is horizontally and vertically symmetric
  -diamond has square shape (e.g. width equals height)
  -top half of diamond has letters in ascending order
  -bottom half has letters in descending order
  -four corners (containing spaces) are triangles
  -e.g. input 'A': 
    -return: A
  -e.g. input 'C' - letter 3:
    -return: 
      -2 spaces, A, 2 spaces, \n
      -1 space, B, 1 space, B, 1 space, \n
      -C, 3 spaces, C, \n
      -1 space, B, 1 space, B, 1 space, \n
      -2 spaces, A, 2 spaces, \n
  -e.g. input 'E' - letter 5:
    -return:
      -4 spaces, A, 4 spaces, \n
      -3 spaces, B, 1 space, B, 3 spaces, \n
      -2 spaces, C, 3 spaces, C, 2 spaces, \n
      -1 space, D, 5 spaces, D, 1 space, \n
      -E, 7 spaces, E, \n
      -repeat D down to A
  -all uppercase letters only

Examples/Test Cases:
  -define `Diamond` class
  -define `make_diamond` class method
    -takes one argument (string representing letter)
    -returns string representation of diamond

Data structures:
  -strings
  -arrays

Brainstorm/Initial Approach:
-use helper method to figure out string for each letter, and store in array that we could join with newline
  -within helper method, need separate helper methods to figure out spacing
-use alphabet array (constant) to figure out spacing and ordering of letters 'A' to the given letter
-use loop to iterate through spaces and lines

-given nth letter of alphabet (`alpha`)
-# spaces before and after A - ALPHA[alpha] - zero-indexed position of given letter
  -decreases by 1 after each line
-# spaces between increments after each line in odds - corresponds to position of letter (if zero-indexed, then index + 1 after B)
  -0 for A
  -1 for B
  -3 for C
  -...

Algorithm:
**`make_diamond` class method:** - takes one argument (string `letter`)
-initialize local variable `alphabet` and assign to array of letters from 'A' to `letter`
-initialize local variable `result` to empty array
-initialize local variable `letter_index` to index of `letter` in `alphabet`
-iterate through `alphabet` with index - block parameters `alpha_letter` and `index`
  -on each iteration:
    -local variable `distance` is `letter_index` - `index`
    -call `single_line` helper method and pass in `alpha_letter`, `letter` and `distance` to generate the correct string
    -append this string into `result`
-initialize local variable `reversed_result` and assign to `result` with last element removed and reversed
-concatenate `result` with `reversed_result` and store in `result`
-join `result` with newline

*`single_line` helper method:* - takes strings `alpha_letter` and `letter` and integer `distance`
  -if `alpha_letter` is 'A', then just return A
  -initialize local variable `inner_space` and assign to return value of calling `find_inner_space` helper method
  -return a string with `distance` * ' ', then `alpha_letter`, then `inner_space` * ' ', then `alpha_letter`, then `distance` * ' '

*`find_inner_space` helper method:* - takes strings `alpha_letter` and `letter`
  -initialize local variable `inner_space_hash` to empty hash
  -initialize `inner_space` to 1
  -iterate from 'B' up to `letter` - block parameter `current_letter`
    -on each iteration:
      -append key `current_letter` to hash with value being `inner_space`
      -increment `inner_space` by 2
  -look up `alpha_letter` in resulting `inner_space_hash`
=end

class Diamond
  def self.make_diamond(letter)
    alphabet = ('A'..letter).to_a
    result = []
    letter_index = alphabet.index(letter)

    alphabet.each_with_index do |alpha_letter, index|
      distance = letter_index - index
      result << single_line(alpha_letter, letter, distance)
    end

    reversed_result = result[0..-2].reverse
    result += reversed_result
    result.join("\n") + "\n"
  end

  class << self
    private

    def single_line(alpha_letter, letter, distance)
      return "#{' ' * distance}A#{' ' * distance}" if alpha_letter == 'A'
      inner_space = find_inner_space(alpha_letter, letter)
      "#{' ' * distance}#{alpha_letter}#{' ' * inner_space}"\
        "#{alpha_letter}#{' ' * distance}"
    end

    def find_inner_space(alpha_letter, letter)
      inner_space_hash = {}
      inner_space = 1

      ('B'..letter).each do |current_letter|
        inner_space_hash[current_letter] = inner_space
        inner_space += 2
      end

      inner_space_hash[alpha_letter]
    end
  end
end
