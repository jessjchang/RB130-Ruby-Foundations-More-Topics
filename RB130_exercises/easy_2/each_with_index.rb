def each_with_index(arr)
  0.upto(arr.size - 1) { |index| yield(arr[index], index) }
  arr
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
# 0 -> 1
# 1 -> 3
# 2 -> 36
# true