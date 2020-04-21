require './lib/shift'
require 'date'

class Enigma

  def rand_number
    rand(100000).to_s.rjust(5, "0")
  end

  def todays_date
    Date.today.strftime("%m%d%y")
  end

  def encrypt(message, key = rand_number, date = todays_date)
    shift = Shift.new(key, date)
    encrypt_hash = Hash.new
    encrypt_hash[:encryption] = shift.encrypt(message)
    encrypt_hash[:key] = key
    encrypt_hash[:date] = date
    encrypt_hash
  end

  def decrypt(message, key = rand_number, date = todays_date)
    shift = Shift.new(key, date)
    decrypt_hash = Hash.new
    decrypt_hash[:decryption] = shift.decrypt(message)
    decrypt_hash[:key] = key
    decrypt_hash[:date] = date
    decrypt_hash
  end


end
