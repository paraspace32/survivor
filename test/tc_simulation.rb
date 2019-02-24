require_relative '../action'
require 'test/unit'

class TcSimulate < Test::Unit::TestCase
  RESULTS = {
    0 => 'Please add people to circle',
    1 => 'Alive Person: 0',
    2 => 'Alive Person: 0',
    3 => 'Alive Person: 1',
    4 => 'Alive Person: 0',
    5 => 'Alive Person: 3',
    6 => 'Alive Person: 2',
    7 => 'Alive Person: 1',
    100 => 'Alive Person: 28'
  }.freeze

  def test_find_alive_person
    RESULTS.each do |val, expected|
      act = Simulate::Action.new(val)
      act.add_person_to_circle
      assert_equal(expected, act.find_alive_person)
    end
  end

  def test_add_person_to_circle
    act = Simulate::Action.new(4)
    assert_equal(4, act.add_person_to_circle)
  end
end
