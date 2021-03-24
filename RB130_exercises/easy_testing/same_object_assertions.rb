require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class List
  def process
    self
  end
end

class SameObjectTest < Minitest::Test
  def test_same_object
    list = List.new
    assert_same(list, list.process)
  end
end