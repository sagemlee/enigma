require './test/test_helper'
require './lib/enigma'
require 'mocha/minitest'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_generate_random_number
    enigma = Enigma.new
    assert_instance_of String, enigma.rand_number
    assert_equal 5, enigma.rand_number.length
    assert enigma.rand_number.to_i < 100000
    assert enigma.rand_number.to_i > 0
  end

  def test_it_has_readable_attributes
    skip
    enigma = Enigma.new("hello world", "02715", "040895")
    assert_equal "hello world", enigma.message
    assert_equal "02715", enigma.key
    assert_equal "040895", enigma.date
    assert_instance_of Shift, enigma.shift
  end

  def test_it_generate_todays_date
    enigma = Enigma.new
    assert_instance_of String, enigma.todays_date
    assert_equal 6, enigma.todays_date.length
    assert enigma.todays_date.to_i < 130000

  end
  #   skip
  #   enigma = Enigma.new("hello world", "02715")
  #   assert_equal 6, enigma.date.length
  # end

  def test_it_can_produce_rand_key_by_default
    skip
    enigma = Enigma.new("hello world")
    assert_equal 6, enigma.date.length
    assert_equal 5, enigma.key.length
  end

  def test_it_can_encrypt
    enigma = Enigma.new
    expected =
    {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_decrypt
    enigma = Enigma.new
    expected =
    {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_without_given_date
    skip
    enigma = Enigma.new("hello world", "02715")
    expected =
    {
      encryption: "jib qdmctpu",
      key: "02715",
      date: "042020"
    }
    assert_equal expected, enigma.encrypt
  end

  #enigma.decrypt(encrypted[:encryption], "02715")

  def test_it_can_decrypt_without_given_date
    enigma = Enigma.new
    expected =
    {
      decryption: "hello world",
      key: "02715",
      date: "042020"
    }
    assert_equal expected, enigma.decrypt("jib qdmctpu", "02715")
  end

  def test_it_can_encrypt_without_given_date_or_key
    enigma = Enigma.new
    Date.stubs(:strftime).returns("042021")
    Enigma.stubs(:date).returns("042021")
    String.stubs(:rand_number).returns("02715")
    expected =
    {
      encryption: "jib qdmctpu",
      key: "02715",
      date: "042020"
    }
    assert_equal expected, enigma.encrypt("hello world")
  end


end
