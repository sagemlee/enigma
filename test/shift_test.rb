require './test/test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test

  def setup
    @shift = Shift.new("02715", "040895")
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_it_has_readable_attributes
    assert_equal "02715", @shift.rand_number
    assert_equal "040895", @shift.date
  end

  def test_it_can_create_keys
    assert_equal ({"A" => 02, "B"=> 27, "C" => 71, "D" => 15}), @shift.keys
  end

  def test_it_can_create_offsets
    assert_equal ({"A" => 1, "B"=> 0, "C" => 2, "D" => 5}), @shift.offsets
  end

  def test_it_can_create_shift
    assert_equal ({"A" => 3, "B"=> 27, "C" => 73, "D" => 20}), @shift.shift
  end

  def test_it_can_encrypt_a_string
    assert_equal "keder ohulw", @shift.encrypt("hello world")
  end
end
