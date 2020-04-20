require './test/test_helper'
require './lib/cipher'

class CipherTest < Minitest::Test

  def test_it_exists
    cipher = Cipher.new("hello world", "02715", "040895")
    assert_instance_of Cipher, cipher
  end

  def test_it_has_readable_attributes
    cipher = Cipher.new("hello world", "02715", "040895")
    assert_equal "hello world", cipher.message
    assert_equal "02715", cipher.key
    assert_equal "040895", cipher.date
    assert_instance_of Shift, cipher.shift
  end

  def test_it_can_produce_todays_date_by_default
    cipher = Cipher.new("hello world", "02715")
    assert_equal 6, cipher.date.length
  end

  def test_it_can_produce_rand_key_by_default
    cipher = Cipher.new("hello world")
    assert_equal 6, cipher.date.length
    assert_equal 5, cipher.key.length
  end

  def test_it_can_encrypt
    cipher = Cipher.new("hello world", "02715", "040895")
    expected =
    {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, cipher.encrypt
  end

  def test_it_can_decrypt
    cipher = Cipher.new("keder ohulw", "02715", "040895")

    expected =
    {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, cipher.decrypt
  end



end
