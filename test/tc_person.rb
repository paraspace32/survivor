require_relative '../person'
require 'test/unit'

class TcPerson < Test::Unit::TestCase
  def test_person
    assert_equal(1, Person.new(1).id)
  end
end
