=begin
Task: compute Scrabble score for a given word
Rules:
  -Tile scores/letter values:
    -1: A, E, I, O, U, L, N, R, S, T
    -2: D, G
    -3: B, C, M, P
    -4: F, H, V, W, Y
    -5: K
    -8: J, X
    -10: Q, Z
  -score is calculated by summing values of all tiles used in each word - if duplicate letters, count as many times as the letter appears
    -e.g. CABBAGE => 1 C, 2 A's, 2 B's, 1 G, 1 E => 3 + 2*1 + 2*3 + 2 + 1 = 14 point total
  -given string (i.e. word) can be upper or lowercase - the letter values count the same either way i.e. 'q' and 'Q' are both 10 points
  -if given `nil`, return score of 0
  -if given empty string, return score of 0
  -strings that don't represent words (i.e. whitespace characters "\t" or "\n") don't count and should be considered value of 0

Examples/Test Cases:
  -define `Scrabble` class
  -constructor takes string as argument, which represents word - don't need to raise errors/validate input
  -define `score` instance method that returns score
  -define `score` class method that takes a string as argument (a word), and also returns score of argument passed in

Data Structures:
  -string
  -array
  -integer
  -hash

Brainstorm/Initial Approach:
#1:
-create score hash for tiles
-use counter to keep track of score
-iterate through the hash
  -count how many times the letter appears in given word, multiply by the value and increment counter
-would have to account for situations where "\" before the letter

#2:
-create score hash for tiles - key: score, value: letters array
-substitute any space characters (/\s/) with empty string
-break down word into characters (note: `String#chars` keeps space characters together when split)
-iterate through word - unique letters only
  -select from the hash where the character is included in the letters array, and multiply score by number of times letter appears in word

#3:
-transform array of letters in word into point values and sum 

Algorithm:
`INITIALIZE` METHOD - takes 1 argument (string `word`):
  -store `word` in instance variable `@word` for later use

`SCORE` INSTANCE METHOD:
  -initialize constant `TILE_SCORES` and assign to hash where key is point value, and value is corresponding array of letters
  -initialize local variable `total_score` to 0 to keep track of total score
  -return `total_score` if `@word` is `nil`
  -substitute any space characters in `word` with empty string and upcase result - assign to local variable `word`
  
  -break down `word` into array of unique characters, and iterate through - block parameter `char`
    -find point value of `char` - use helper method `find_value` - store in local variable `point_val`
    -find count of `char` in `word` - store in local variable `char_count`
    -multiply `char_count` by `point_val`, and increment `total_score` by this value
  
  -once finished iterating through all characters, return `total_score`

`find_value` helper method - takes one argument (string `char`):
  -select from `TILE_SCORES` key-value pair where the letters array includes `char`
  -return the key (i.e. point value)

`SCORE` CLASS METHOD - takes one argument (string `str`):
  -instantiate a new `Scrabble` object and pass in `str` as argument to `new` class method
  -call `score` instance method on this new object
=end

class Scrabble
  TILE_SCORES = { 1 => %w(A E I O U L N R S T),
                  2 => %w(D G),
                  3 => %w(B C M P),
                  4 => %w(F H V W Y),
                  5 => %w(K),
                  8 => %w(J X),
                  10 => %w(Q Z) }.freeze

  def self.score(str)
    Scrabble.new(str).score
  end

  def initialize(word)
    @word = word
  end

  def score
    total_score = 0
    return total_score if @word.nil?
    word = @word.gsub(/\s/, '').upcase

    word.chars.uniq.each do |char|
      point_val = find_value(char)
      char_count = word.count(char)
      total_score += point_val * char_count
    end

    total_score
  end

  private

  def find_value(char)
    TILE_SCORES.select { |_point_val, arr| arr.include?(char) }.keys.first
  end
end
