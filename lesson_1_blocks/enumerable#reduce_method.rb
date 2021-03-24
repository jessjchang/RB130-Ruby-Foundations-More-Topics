# USING `while` LOOP:

def reduce(array, accumulator=0)
  counter = 0
  
  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end
  
  accumulator
end

# USING `Array#each`:

def reduce(array, accumulator=0)
  array.each do |el|
    accumulator = yield(accumulator, el)
  end
  
  accumulator
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

# IMPROVED DEFAULT BEHAVIOR:

def reduce(array, default=nil)
  accumulator = default ? default : array[0]
  counter = default ? 0 : 1
  
  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end
  
  accumulator
end

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
p reduce([1, 2, 3, 4], 1) { |acc, num| acc + num } # => 11