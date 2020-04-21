require './lib/shift'
require 'date'

class Enigma
  attr_reader :message, :key, :date, :shift

  def rand_number
    rand(100000).to_s.rjust(5, "0")
  end

  def initialize(message, key = rand_number, date = Date.today.strftime("%m%d%y"))
    @message = message
    @key = key
    @date = date
    @shift = Shift.new(@key, @date)
  end

  def encrypt
    encrypt_hash = Hash.new
    encrypt_hash[:encryption] = @shift.encrypt(@message)
    encrypt_hash[:key] = @key
    encrypt_hash[:date] = @date
    encrypt_hash
  end

  def decrypt
    decrypt_hash = Hash.new
    decrypt_hash[:decryption] = @shift.decrypt(@message)
    decrypt_hash[:key] = @key
    decrypt_hash[:date] = @date
    decrypt_hash
  end


end
