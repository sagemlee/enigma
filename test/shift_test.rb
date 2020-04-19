require './test/test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test

  def test_it_exists
    shift = Shift.new("12345", 041920)
    assert_equal Shift, shift
  end
end
