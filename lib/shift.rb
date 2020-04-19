#hash of A = {key => something, offset => somthing}
#key and offset will be initialized in shift
require 'pry'
class Shift
  attr_reader :rand_number, :date
  def initialize(rand_number, date)
    @rand_number = rand_number
    @date = date
    @alphabet =("a".."z").to_a << " "

  end

  def keys
    assignments = {}
    assignments["A"] = @rand_number[0..1].to_i
    assignments["B"] = @rand_number[1..2].to_i
    assignments["C"] = @rand_number[2..3].to_i
    assignments["D"] = @rand_number[3..4].to_i
    assignments
  end

  def offsets
    assignments = {}
    square_date = (@date.to_i * @date.to_i).to_s
    assignments["A"] = square_date[-4].to_i
    assignments["B"] = square_date[-3].to_i
    assignments["C"] = square_date[-2].to_i
    assignments["D"] = square_date[-1].to_i
    assignments
  end

  def shift
    assignments = {}
    assignments["A"] = keys["A"] + offsets["A"]
    assignments["B"] = keys["B"] + offsets["B"]
    assignments["C"] = keys["C"] + offsets["C"]
    assignments["D"] = keys["D"] + offsets["D"]
    assignments
  end

  def new_alphabet
    new_indexes = @alphabet.map do |letter|
      if @alphabet.find_index(letter) == 0 || @alphabet.find_index(letter).modulo(4) == 0
        @alphabet.find_index(letter) + shift["A"]
      elsif @alphabet.find_index(letter).modulo(4) == 1
        @alphabet.find_index(letter) + shift["B"]
      elsif @alphabet.find_index(letter).modulo(4) == 2
        @alphabet.find_index(letter) + shift["C"]
      else
        @alphabet.find_index(letter) + shift["D"]
      end
    end
    new_letters = new_indexes.map do |number|
      if number < 27
        @alphabet.find do |letter|
          @alphabet.find_index(letter) == number
        end
      else
        low_num = number
        until low_num < 27
          low_num -= 27
        end
        @alphabet.find do |letter|
          @alphabet.find_index(letter) == low_num
        end
      end
    end
    new_letters.to_h do |letter|
      [new_letters.find_index(letter), letter]
    end
  end

end
