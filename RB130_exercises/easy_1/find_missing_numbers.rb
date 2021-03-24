# Solution 1

def missing(arr)
  full_range = (arr.first..arr.last).to_a
  full_range - arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# # Solution 2

def missing(arr)
  result = []
  arr.each_cons(2) do |num1, num2|
    result.concat(((num1 + 1)..(num2 - 1)).to_a)
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# # Solution 3

def missing(arr)
  result = []
  0.upto(arr.size - 2) do |index|
    if arr[index] + 1 == arr[index + 1]
      next
    else
      curr_num = arr[index] + 1
      loop do
        result << curr_num
        curr_num += 1
        break if curr_num == arr[index + 1]
      end
    end
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []