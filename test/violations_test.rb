
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/violation'
# require './lib/full_event_attendees.csv'

class VioationsTest < Minitest::Test

  def test_it_loads_CSV
    violation = Violation.new
    violation.print_format

    assert_instance_of Array, violation.load
  end
end
