=begin
Task: create a custom set type
Rules:
  -behave like a set of unique elements that can be manipulated in several ways
  -may assume that all elements of a set must be numbers

Examples/Test Cases:
  -define `CustomSet` class
  -constructor:
    -can take 0 or 1 arguments (if argument passed in, array of integers)
    -if no argument passed in, set is essentially empty
    -no duplicates 
    -order doesn't matter
  -define `empty?` instance method
    -returns `true` if set is empty, and `false` otherwise
  -define `contains?` instance method
    -takes 1 argument (integer)
    -returns `true` if set contains the argument, and `false` if otherwise
  -define `subset?` instance method
    -takes a `CustomSet` object as argument
    -returns `true` if calling `CustomSet` object is subset of argument
    -e.g. empty object is subset of empty object and non-empty object(i.e. calling object is empty and argument is non-empty) - return `true`
    -e.g. non-empty object is not subset of empty object (i.e. calling object is non-empty and argument is empty) - return `false`
    -if calling object has same elements as argument object or all of its elements are included in argument object's set of elements, then return `true`
  -define `disjoint?` instance method
    -takes a `CustomSet` object as argument
    -return `true` if both empty, if empty and non-empty or vice versa, if no shared elements
    -return `false` if both objects share same element, even if just one
  -define `eql?` instance method
    -takes a `CustomSet` object as argument
    -return `true` if have all the same elements (or lack of elements in case of empty)
    -order doesn't matter
    -duplicate elements don't matter (i.e. if one set has duplicates but all the unique elements are still the same, then return `true`)
  -define `add` instance method
    -takes integer as argument
    -adds argument into set
    -if argument is a duplicate, don't add into set
  -define `intersection` instance method
    -takes `CustomSet` object as argument
    -returns `CustomSet` object that contains only the shared elements
  -define `difference` instance method
    -takes `CustomSet` object as argument
    -returns `CustomSet` object that contains different elements
    -if given two empty objects or if calling object is empty and argument is non-empty, return empty object
    -if calling object is non-empty and argument is empty, return non-empty object
    -returned object only contains elements from calling object that are not in argument
  -define `union` instance method
    -takes `CustomSet` object as argument
    -join the elements of both objects into one object
    -remove duplicates
  -define `==` instance method so `assert_equal` works
    -alias for `eql?` instance method

Data structures:
  -arrays

Algorithm:
****`CustomSet` class:****

*implement protected getter method for `@elements`*

**`initialize` method:** - takes 0 or 1 arguments `array` - default to empty array
  -break down `array` into unique elements only
  -initialize instance variable `@elements` and assign to `array` 

**`empty?` instance method:**
  -check if `@elements` is empty
    -if so, return `true`
    -otherwise, return `false`

**`contains?` instance method:** - takes one argument `num`
  -check if `@elements` contains `num`
    -if so, return `true`
    -otherwise, return `false`

**`subset?` instance method:** - takes one argument `other_set`
  -if all of elements in calling object's `@elements` are included in `other_set`'s `@elements`, return `true`
  -otherwise, return `false`

**`disjoint?` instance method:** - takes one argument `other_set`
  -if any of elements in calling object's `@elements` are included in `other_set`'s `@elements`, return `false`
  -otherwise, return `true`

**`eql?` instance method:** - takes one argument `other_set`
  -if all `@elements` are in `other_set`'s `@elements, and they are same size, return `true`
  -otherwise, return `false`

**`add` instance method:** - takes integer `num` as argument
  -if `@elements` doesn't include `num`, append `num` to `@elements`
  -return self

**`intersection` instance method:** - takes one argument `other_set`
  -select only the elements of `@elements` that are also in `other_set`'s `@elements`
  -return new `CustomSet` instance whose `@elements` are the selected elements

**`difference` instance method:** - takes one argument `other_set`
  -select only the elements of `@elements` that are not in `other_set`'s `@elements`
  -return new `CustomSet` instance whose `@elements` are the selected elements

**`union` instance method:** - takes one argument `other_set`
  -combine `@elements` of both
  -return new `CustomSet` instance whose `@elements` are the newly combined elements

**`==` instance method:** - takes one argument `other_set`
  -
=end

class CustomSet
  def initialize(array=[])
    @elements = array.uniq
  end

  def empty?
    elements.empty?
  end

  def contains?(num)
    elements.include?(num)
  end

  def subset?(other_set)
    elements.all? { |el| other_set.contains?(el) }
  end

  def disjoint?(other_set)
    !elements.any? { |el| other_set.contains?(el) }
  end

  def eql?(other_set)
    subset?(other_set) && elements.size == other_set.elements.size
  end

  alias == eql?

  def add(num)
    elements << num unless contains?(num)
    self
  end

  def intersection(other_set)
    new_elements = elements.select { |el| other_set.contains?(el) }
    CustomSet.new(new_elements)
  end

  def difference(other_set)
    new_elements = elements.reject { |el| other_set.contains?(el) }
    CustomSet.new(new_elements)
  end

  def union(other_set)
    new_elements = elements + other_set.elements
    CustomSet.new(new_elements)
  end

  protected

  attr_reader :elements
end
