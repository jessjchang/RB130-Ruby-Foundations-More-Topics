factorial = Enumerator.new do |y|
  acc = 1
  num = 0
  loop do
    y << acc
    num += 1
    acc *= num
  end
end

7.times { |num| puts "#{num}!: #{factorial.next}" }
puts
3.times { |num| puts "#{num}!: #{factorial.next}" }
puts
factorial.rewind
7.times { |num| puts "#{num}!: #{factorial.next}" }

# Output:
# 0!: 1
# 1!: 1
# 2!: 2
# 3!: 6
# 4!: 24
# 5!: 120
# 6!: 720

# 0!: 5040
# 1!: 40320
# 2!: 362880

# 0!: 1
# 1!: 1
# 2!: 2
# 3!: 6
# 4!: 24
# 5!: 120
# 6!: 720

factorial.each_with_index do |fact_value, num|
  puts "#{num}!: #{fact_value}"
  break if num >= 6
end

# 0!: 1
# 1!: 1
# 2!: 2
# 3!: 6
# 4!: 24
# 5!: 120
# 6!: 720

p factorial.take(7) # => [1, 1, 2, 6, 24, 120, 720]
p factorial.take(7) # => [1, 1, 2, 6, 24, 120, 720]
