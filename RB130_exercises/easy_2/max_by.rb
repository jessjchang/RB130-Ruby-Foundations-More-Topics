def max_by(arr)
  result = nil
  largest_returned_val = nil
  arr.each do |el|
    curr_return_val = yield(el)
    if largest_returned_val.nil? || curr_return_val > largest_returned_val
      largest_returned_val = curr_return_val
      result = el
    end
  end
  result
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil