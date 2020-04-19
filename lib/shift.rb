#hash of A = {key => something, offset => somthing}
#key and offset will be initialized in shift
require 'pry'
class Shift
  attr_reader :rand_number, :date
  def initialize(rand_number, date)
    @rand_number = rand_number
    @date = date
  end

  def keys
    assignments = {}
    assignments["A"] = @rand_number[0..1].to_i
    assignments["B"] = @rand_number[1..2].to_i
    assignments["C"] = @rand_number[2..3].to_i
    assignments["D"] = @rand_number[3..4].to_i
    assignments
  end

  x
end
