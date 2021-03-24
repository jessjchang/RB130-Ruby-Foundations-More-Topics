def zip(arr1, arr2)
  (0..(arr1.size - 1)).each_with_object([]) { |index, result| result << [arr1[index], arr2[index]] }
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]