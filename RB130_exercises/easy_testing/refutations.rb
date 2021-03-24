require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class RefutationTest < Minitest::Test
  def test_refutations
    list = ['abc', 'xyz', 'def']
    refute_includes(list, 'xyz')
  end
end

# Failure Message: Expected ["abc", "xyz", "def"] to not include "xyz".