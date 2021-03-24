=begin
Task:
  -define `DNA` class
  -constructor takes one argument (DNA strand represented by string)
  -define `hamming_distance` instance method that takes one argument (another DNA strand represented by string)
    -find hamming distance i.e. number of differences between calling `DNA` object's strand and the DNA strand passed in as argument
Rules:
  -if 2 strands are different lengths, find the hamming distance based off shorter strand (i.e. find minimum number of differences)

Data structures:
-strings
-arrays?

Brainstorm/Initial Approach:

Option #1:
-find the length of the two DNA strands (2 strings)
-figure out shorter one
-use a counter to store the hamming distance
-iterate through shorter string and find the number of differences based off indices, adding to counter if different

Option #2:
-convert shorter string to array of individual character elements
-use `select` on the shorter string with index, and select the elements that are not in the other string based off indices
-find the size of the resulting array

Algorithm:
`initialize` method:
-pass in a `str` as argument
-assign instance variable `@strand_1` to string referenced by `str`

`hamming_distance` method - takes `strand2` as argument:
-store `@strand1` and `strand2` as elements of an array `strands`
-sort `strands` by length and store each in local variables `shorter_strand` and `longer_strand`
-convert `shorter_strand` to array of individual characters and store in `strand_arr`
-iterate through `strand_arr` with index
  -on each iteration, pass in an element of `strand_arr` (block parameter `el`) and current index (`index`)
    -if `el` is not equivalent to character at `index` of `longer_strand`, append to a new array `arr`
    -otherwise, move onto next iteration
-find size of `arr`
=end

class DNA
  def initialize(str)
    @strand1 = str
  end

  def hamming_distance(strand2)
    shorter_strand, longer_strand = [@strand1, strand2].sort_by(&:length)
    strand_arr = shorter_strand.chars

    strand_arr.select.with_index { |el, index| el != longer_strand[index] }.size
  end
end
