# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Output:
# #<Proc:0x00007f8b508d03a0@procs_lambdas_blocks.rb:2>
# Proc
# This is a .
# This is a cat.

# Observations:
# local variable `my_proc` is assigned to reference a `Proc` object (i.e. instance of the `Proc` class)
# We instantiated a new `Proc` object by calling `proc` instead of `Proc.new`
# When we invoke `call` on `my_proc` with no argument passed in, the block parameter `thing` is assigned to `nil`, and we're still able to successfully execute the block statement
# When we invoke `call` on `my_proc` with an argument passed in, `'cat'`, block parameter `thing` is assigned to reference the string `'cat'`
# `Proc`s thus have lenient arity rules

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Output:
# #<Proc:0x00007fc8f5134320@procs_lambdas_blocks.rb:15 (lambda)>
# #<Proc:0x00007fc8f51342f8@procs_lambdas_blocks.rb:16 (lambda)>
# Proc
# This is a dog.
# => Raise ArgumentError

# Observations:
# local variables `my_lambda` and `my_second_lambda` are assigned to reference `Lambda`s
# We can instantiate new `Lambda`s either by calling `lambda` or `->`
# On line 28, we can't instantiate a new `Lambda` object with `Lambda.new`. We throw a `NameError` with that line.
# A `Lambda` seems to be a type of `Proc` object. It's output when we call `puts` and pass in a `Lambda` object is only slightly different from that of a `Proc` object (still outputs the `Proc` class name with an encoding of the object id, only with an additional `(lambda)` signifier at the end).
# If we invoke `call` on a `Lambda` object and don't pass in the required number of arguments, we throw an exception.
# `Lambda`s thus have strict arity rules

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

# Output:
# This is a .
# => Raise LocalJumpError

# Observations:
# If we pass an argument into a method, but that argument is not also passed into the block, then we still execute the block statement, but the block parameter references `nil`
# If we use `yield` in our method but don't pass a block into our method invocation, we raise an error

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

# Output:
# This is a turtle.
# This is a turtle and a .
# => Raise NameError: undefined local variable or method `animal' for main:Object

# Observations:
# If we pass fewer arguments than there are block parameters, the block will still execute, and the remaining parameters will just reference `nil`
# If we try to reference a variable in a block that wasn't passed to the block and is outside of the block's scope, we raise an error.
# Blocks have lenient arity rules.

# Final observations:
# `Proc` objects and implicit blocks don't enforce the number of arguments passed in, while `Lambda` objects do