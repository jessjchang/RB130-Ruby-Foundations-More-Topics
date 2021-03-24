=begin
Task: generate lyrics of 99 Bottles of Beer song
Rules:
  -lyrics given "n" bottles of beer:
    -"(n) bottles of beer on the wall, (n) bottles of beer.\n" \
      "Take one down and pass it around, (n-1) bottles of beer on the wall.\n"
  -when get down to 1 bottle of beer, have to change from "bottles" to "bottle"
  -when 0 bottles of beer, line changes to "no more bottles"
  -when currently have 0, then second line: "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

Examples/Test Cases:
  -define `BeerSong` class
  -define `verse` class method - takes one argument (integer representing number of current beer bottles)
    -returns the corresponding lyrics
  -define `verses` class method - takes two arguments (integers representing number of current beer bottles, and second represents the ending number of current beer bottles)
    -return verses from first argument to the second
      -include newline i.e. "\n" \ between verses
  -define `lyrics` class method
    -takes no arguments
    -returns the whole song from 99 bottles to 0 (no more bottles)

Data structures:
  -strings
  -integers
  -arrays

Brainstorm/Initial Approach:
#1:
-use separate class e.g. `Verse` 
  -instance variable `num_bottles`
  -when use string interpolation on `Verse` object, returns the appropriate lyric
-`verse` class method of `BeerSong` would print appropriate `Verse` objects
-`lyric` class method of `BeerSong` would print `Verse` objects from 99 down to 0
-use array to store verses, then join them

#2:
-iterate from first argument down to second argument
-use `case` statement to determine if need special prompt for 1, 0, or negative bottles (i.e. reset)

Algorithm:
`BEERSONG` CLASS:

-`VERSE` CLASS METHOD - takes one argument - integer argument `num`:
  -instantiate `Verse` object with `num` passed into `new`
  -call `to_s` method on `Verse` object

-`VERSES` CLASS METHOD - takes two arguments - integer arguments `num1` and `num2`:
  -initialize local variable `result` to empty array object to store results
  -iterate from `num1` down to `num2` - block parameter `num_bottles`
    -on each iteration:
      -call `Verse` class method with `num_bottles` passed in as argument, and append to `result`
  -once finished iterating, join `result` with newline 

-`LYRICS` CLASS METHOD
  -call `VERSES` class method with 99 and 0 passed in as arguments

`VERSE` CLASS:

-`INITIALIZE` METHOD - takes one argument (integer `num_bottles`):
  -initialize instance variable `@num_bottles` to store argument for later use

-`TO_S` METHOD:
  -initialize local variable `num_bottles` and assign to return value of calling `bottle_input` helper method and passing in `@num_bottles` as argument
  -initialize local variable `one_down_bottle` and assign to return value of calling `bottle_input` helper method and passing in `@num_bottles - 1` as argument
  -concatenate return values of `first_verse` and `second_verse` helper methods

`BOTTLE_INPUT` HELPER METHOD - takes `num_bottles` as single integer argument":
  -if `num_bottles` is > 1, return "`num_bottles` bottles"
  -otherwise, if `num_bottles` == 1, return "1 bottle"
  -otherwise, if `num_bottles` == 0, return "no more bottles"
  -otherwise, return "less than 0"

`FIRST_VERSE` HELPER METHOD - takes `num_bottles` as single integer argument":
  -use string interpolation to interpolate into appropriate string
    -reference `num_bottles`

`SECOND_VERSE` HELPER METHOD - takes `num_bottles` as single integer argument":
  -check if `num_bottles` is equivalent to "less than 0"
    -if so, return special string when need to restart song
    -if `num_bottles` is equivalent to "no more bottles", have to change string to "take it down"
    -otherwise, reference `num_bottles` to interpolate into appropriate string

=end

class BeerSong
  def self.verse(num)
    Verse.new(num).to_s
  end

  def self.verses(num1, num2)
    result = []
    num1.downto(num2) do |num_bottles|
      result << verse(num_bottles)
    end
    result.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end

class Verse
  def initialize(num_bottles)
    @num_bottles = num_bottles
  end

  def to_s
    num_bottles = bottle_input(@num_bottles)
    one_down_bottle = bottle_input(@num_bottles - 1)

    first_verse(num_bottles) + second_verse(one_down_bottle)
  end

  private

  def bottle_input(num_bottles)
    case num_bottles
    when 2..99 then "#{num_bottles} bottles"
    when 1 then "1 bottle"
    when 0 then "no more bottles"
    else "less than 0"
    end
  end

  def first_verse(num_bottles)
    "#{num_bottles.capitalize} of beer on the wall, #{num_bottles} of beer.\n"
  end

  def second_verse(num_bottles)
    if num_bottles == "less than 0"
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    elsif num_bottles == "no more bottles"
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    else
      "Take one down and pass it around, #{num_bottles} of beer on the wall.\n"
    end
  end
end
