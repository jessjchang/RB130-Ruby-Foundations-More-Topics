items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Problem 1:
gather(items) do |*food, last_food|
  puts food.join(', ')
  puts last_food
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# Problem 2:
gather(items) do |first_item, *food, last_food|
  puts first_item
  puts food.join(', ')
  puts last_food
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

# Problem 3:
gather(items) do |first_item, *food|
  puts first_item
  puts food.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

# Problem 4:
gather(items) do |first_item, second_item, third_item, fourth_item|
  puts "#{first_item}, #{second_item}, #{third_item}, #{fourth_item}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!