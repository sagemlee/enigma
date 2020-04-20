require './lib/shift'
require 'date'

class Cipher
  attr_reader :message, :key, :date, :shift

  def initialize(message, key = rand(100000).to_s.rjust(5, "0"), date = Date.today.strftime("%m%d%y"))
    @message = message
    @key = key
    @date = date
    @shift = Shift.new(@key, @date)
  end


end
