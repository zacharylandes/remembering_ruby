
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/violation'
require 'pry'
# require './lib/full_event_attendees.csv'

class VioationsTest < Minitest::Test

  def test_it_counts_each_type
    violation = Violation.new
      violation.count_type
      
      assert_equal 10, violation.count_type
  end


end
