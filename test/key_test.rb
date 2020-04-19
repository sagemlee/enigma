require './test/test_helper'
require './lib/key'

class KeyTest < Minitest::Test
  def test_it_exists
    key = Key.new
    assert_instance_of Key, key
  end

  def test_it_has_readable_attributes
    key = Key.new

    expected =
    ["a","b",
     "c","d",
     "e","f",
     "g","h",
     "i", "j",
     "k", "l",
     "m", "n",
     "o", "p",
     "q", "r",
     "s", "t",
     "u", "v",
     "w", "x",
     "y", "z",
    " "]
    assert_equal expected, key.alphabet
  end
end
