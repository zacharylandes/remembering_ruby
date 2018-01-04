
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/violation'
require 'pry'
# require './lib/full_event_attendees.csv'

class VioationsTest < Minitest::Test

  def test_it_loads_CSV
    violation = Violation.new
    violation = violation.load
    violation.sorted
  end
end
