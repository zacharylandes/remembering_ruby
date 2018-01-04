require 'csv'
require 'pry'

class Violation
  def initialize(violation=nil)
    @violation = violation
    @violations = []
    @format = '%-14s %-11s %-36s %-7s %-17s %7s '
    @headers = ['violation_id','inspection_id','violation_category','violation_date','violation_date_closed','violation_type']

  end

  def load(file = './Violations-2012.csv')
    contents = CSV.open file, headers: true, header_converters: :symbol
    contents.each { |row| @violations << row}
    @violations
  end

  def sorted
    @violations.sort_by{ |row| row['violation_type'] }
  end

  def row_order(attendee)
  [attendee[:violation_id], attendee[:inspection_id],
   attendee[:violation_category],attendee[:violation_date], attendee[:violation_date_closed],
   attendee[:violation_type]]
end

  def print_loop
    load
    @violations.each_with_index do |attendee, _|
      puts @format % row_order(attendee)
    end
  end

  def print_format
    puts @format % @headers
    print_loop
  end

  end
