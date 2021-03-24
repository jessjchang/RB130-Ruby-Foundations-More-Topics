arr = %w(raven finch hawk eagle)

def group_types(arr)
  yield(arr)
end

group_types(arr) { |_, _, *raptors| puts "Raptors: #{raptors.join(', ')}" }

# Raptors: hawk, eagle