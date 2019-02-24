require_relative '../circle'
require 'test/unit'

class TcCircle < Test::Unit::TestCase
  def setup
    @circle = Circle.new
    @circle.group = [0, 1, 2, 3]
  end

  def test_circle
    assert_equal(3, @circle.next_left(@circle.group))
    assert_equal(2, @circle.next_left(@circle.group))
    assert_equal(1, @circle.next_left(@circle.group))
  end
end
