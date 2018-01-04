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
    @violations = @violations.take(10)
  end

  def sorted
    load
     @violations.sort_by!{ |row| row['violation_type'] }
  end

  def row_order(violation)
  [violation[:violation_id], violation[:inspection_id],
   violation[:violation_category],violation[:violation_date], violation[:violation_date_closed],
   violation[:violation_type]]
end

  def print_loop
    sorted.each_with_index do |violation, _|
      puts @format % row_order(violation)
    end
  end

  def print_format
      puts @format % @headers
    print_loop
  end

    def count_type
      sorted.count("Animal Feces")
    end

  end
