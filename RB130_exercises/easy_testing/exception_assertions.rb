require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class NoExperienceError < StandardError; end

class Employee
  def initialize(experience)
    @experience = experience
  end

  def hire
    raise NoExperienceError unless @experience
  end
end

class ExceptionTest < MiniTest::Test
  def test_exception
    employee = Employee.new(true)
    assert_raises(NoExperienceError) { employee.hire }
  end
end

# Failure Message: NoExperienceError expected but nothing was raised.