require './test/test_helper'
require './lib/enigma'
require 'mocha/minitest'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new("hello world", "02715", "040895")
    assert_instance_of Enigma, enigma
  end

  def test_it_has_readable_attributes
    enigma = Enigma.new("hello world", "02715", "040895")
    assert_equal "hello world", enigma.message
    assert_equal "02715", enigma.key
    assert_equal "040895", enigma.date
    assert_instance_of Shift, enigma.shift
  end

  def test_it_can_produce_todays_date_by_default
    enigma = Enigma.new("hello world", "02715")
    assert_equal 6, enigma.date.length
  end

  def test_it_can_produce_rand_key_by_default
    enigma = Enigma.new("hello world")
    assert_equal 6, enigma.date.length
    assert_equal 5, enigma.key.length
  end

  def test_it_can_encrypt
    enigma = Enigma.new("hello world", "02715", "040895")
    expected =
    {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.encrypt
  end

  def test_it_can_decrypt
    enigma = Enigma.new("keder ohulw", "02715", "040895")

    expected =
    {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.decrypt
  end

  def test_it_can_encrypt_without_given_date
    enigma = Enigma.new("hello world", "02715")
    expected =
    {
      encryption: "jib qdmctpu",
      key: "02715",
      date: "042020"
    }
    assert_equal expected, enigma.encrypt
  end

  def test_it_can_decrypt_without_given_date
    enigma = Enigma.new("jib qdmctpu", "02715")
    expected =
    {
      decryption: "hello world",
      key: "02715",
      date: "042020"
    }
    assert_equal expected, enigma.decrypt
  end

  def test_it_can_encrypt_without_given_date_or_key
    Date.stubs(:strftime).returns("042021")


    enigma = Enigma.new("hello world")
    Enigma.stubs(:date).returns("042021")
    expected =
    {
      encryption: "jib qdmctpu",
      key: "02715",
      date: "042020"
    }
    assert_equal expected, enigma.encrypt
  end


end
