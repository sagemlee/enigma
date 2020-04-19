require './test/test_helper'
require './lib/alphabet'

class AlphabetTest < Minitest::Test

  def test_it_exists
    alphabet = Alphabet.new
    assert_instance_of Alphabet, alphabet
  end

  def test_it_has_readable
end
