=begin
Task: 
  -Determine whether triangle is equilateral, isosceles, or scalene
  -define `Triangle` class
  -define `kind` instance method that returns triangle type
  -define constructor that raises `ArgumentError` if try to instantiate invalid `Triangle` object
Rules:
  -equilateral: all three sides same length
  -isosceles: exactly two sides same length
  -scalene: all sides different lengths
  -valid triangle: 
    -all side lengths > 0
    -sum of lengths of any two sides >= length of remaining third side

Data structures:
-Integers as inputs for side lengths
-Strings as return value of triangle type
-Arrays

Algorithm:
`initialize` method:
-store input side lengths `s1`, `s2`, and `s3` in an array `side_lengths`
-raise an `ArgumentError` if side lengths aren't valid (use `invalid?` helper method)

`invalid?` helper method:
-return `true` if any side lengths are <= 0
-compare whether sum of any two side lengths < the remaining using index reference, and return `true` if so

`kind` method:
-find unique values in `side_lengths` and store in local variable `unique_side_lengths`
-return `equilateral` if size of `unique_side_lengths` is 1
-return `isosceles` if size of `unique_side_lengths` is 2
-otherwise, return `scalene`
=end

class Triangle
  def initialize(s1, s2, s3)
    @side_lengths = [s1, s2, s3]
    raise ArgumentError.new, "Invalid triangle" if invalid?
  end

  def kind
    unique_side_lengths = @side_lengths.uniq
    case unique_side_lengths.size
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    else 'scalene'
    end
  end

  private

  def invalid?
    @side_lengths.any? { |side| side <= 0 } ||
      @side_lengths[0] + @side_lengths[1] < @side_lengths[2] ||
      @side_lengths[1] + @side_lengths[2] < @side_lengths[0] ||
      @side_lengths[0] + @side_lengths[2] < @side_lengths[1]
  end
end
