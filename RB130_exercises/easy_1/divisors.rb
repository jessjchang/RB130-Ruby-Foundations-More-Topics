def divisors(num)
  (1..num).select do |curr_num|
    num % curr_num == 0
  end
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# Further Exploration

def divisors(num)
  result = []
  square_root = Math.sqrt(num).floor

  (1..square_root).each do |curr_num|
    if num % curr_num == 0
      result << (num / curr_num)
      result << curr_num
    end
  end

  result.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]
p divisors(999962000357) == [1, 999979, 999983, 999962000357]
