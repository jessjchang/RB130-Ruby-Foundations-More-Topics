def compute
  block_given? ? yield : 'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Further Exploration
def compute(arg)
  return 'Does not compute.' unless block_given?
  yield(arg)
end

p compute('hello') { |str| str + ' goodbye' } == 'hello goodbye'
p compute(4) { |num| num * 2 } == 8
p compute(4) == 'Does not compute.'