require 'minitest/autorun'

require_relative 'text'

class TextTest < MiniTest::Test
  def setup
    @file = File.open('sample_text.txt', 'r')
    @string = @file.read
    @text = Text.new(@string)
  end

  def test_swap
    num_a = @string.count('a')
    num_e = @string.count('e')
    modified_text = @text.swap('a', 'e')

    assert_equal(@string.length, modified_text.length)
    assert_equal(num_a + num_e, modified_text.count('e'))
    assert_equal(0, modified_text.count('a'))
  end

  def test_word_count
    assert_equal(72, @text.word_count)
  end

  def teardown
    @file.close
  end
end