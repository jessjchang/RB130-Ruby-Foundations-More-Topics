def step(starting_val, ending_val, step_val)
  current_val = starting_val
  loop do
    break if current_val > ending_val
    yield(current_val)
    current_val += step_val
  end
  current_val
end

step(1, 10, 3) { |value| puts "value = #{value}" }
# value = 1
# value = 4
# value = 7
# value = 10