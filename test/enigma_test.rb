require './test/test_helper'
require 'date'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Engima.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_with_key_and_date
    expected =
    {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt_with_key_and_date
    expected =
    {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_with_key_today
    assert_equal expected,
  end

  def test_it_can_decrypt_with_key_today

  end

  def test_it_can_encrypt_with_random_key_today
  end 

end
