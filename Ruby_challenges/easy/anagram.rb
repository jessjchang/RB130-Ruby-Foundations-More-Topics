=begin
Task: given a word and list of possible anagrams, find the actual anagrams of the given word
Rules:
  -anagram is a word that contains the same letters (and exact same number of each letter) as another word
  -if we can rearrange the word into the given word exactly, it's an anagram
  -order of returned list doesn't matter - sorted alphabetically in test itself
  -same word is not considered an anagram
  -case insensitive - does not have to be in same lettercase i.e. 'C' is same as 'c'
  -return empty array if no anagrams found

Examples/Test Cases:
-define `Anagram` class
-constructor takes one argument - a string representing the word to compare against
  -don't need to raise any errors
-define `match` instance method
  -takes array of strings as argument
  -return value will be array of strings that contains the anagrams of the word

Data Structures:
-strings
-arrays

Brainstorm/Initial Approach:
#1:
-break down word into array and sort it alphabetically, then join back into word - helper method?
-empty array to store results
-iterate through list of candidates
  -if the candidate downcased is the same as the given word downcased, just move onto next iteration
  -for each candidate, sort it alphabetically, and if it's the same (case insensitive) as the sorted word, then store candidate in results array

#2:
-create array of alphabet
-count number of occurrences of each letter, and if match exactly then anagram

Algorithm:
`INITIALIZE` METHOD - takes one argument `word`:
-store into `@word` instance variable for later use

`MATCH` METHOD - takes one argument, an array `candidates`:
-use `sort_word` helper method on `@word` and store result in local variable `sorted_word`
-initialize local variable `anagrams` to empty array
-iterate through `candidates` - block parameter `candidate`
  -on each iteration:
    -if `candidate` downcased is equivalent to `word` downcased, move onto next iteration
    -otherwise, use `sort_word` helper method on `candidate` and check if equal to `sorted_word`
      -if so, append `candidate` to `anagrams` array
      -otherwise, move onto next iteration
-return `anagrams`

`sort_word` helper method - takes a string `str` as argument:
-downcase `str`, break down into array of characters and sort alphabetically, then join back into one word
=end

class Anagram
  def initialize(word)
    @word = word
  end

  def match(candidates)
    sorted_word = sort_word(@word)
    anagrams = []
    candidates.each do |candidate|
      next if candidate.downcase == @word.downcase
      anagrams << candidate if sort_word(candidate) == sorted_word
    end
    anagrams
  end

  private

  def sort_word(str)
    str.downcase.chars.sort.join
  end
end
