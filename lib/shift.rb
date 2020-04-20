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



  def encrypt(message)
    message_array = message.split(//)
    letter_number = 0
    changed_message = []
    message_array.each do |letter|
      if letter_number == 0 || letter_number.modulo(4) == 0
        new_num = @alphabet.find_index(letter) + shift["A"]
        if new_num < 27
          changed_message << @alphabet[new_num]
        else
          until new_num < 27
            new_num -= 27
          end
          changed_message << @alphabet[new_num]
        end
      elsif letter_number == 1 || letter_number.modulo(4) == 1
        new_num = @alphabet.find_index(letter) + shift["B"]
        if new_num < 27
          changed_message << @alphabet[new_num]
        else
          until new_num < 27
            new_num -= 27
          end
          changed_message << @alphabet[new_num]
        end
      elsif letter_number == 2 || letter_number.modulo(4) == 2
        new_num = @alphabet.find_index(letter) + shift["C"]
        if new_num < 27
          changed_message << @alphabet[new_num]
        else
          until new_num < 27
            new_num -= 27
          end
          changed_message << @alphabet[new_num]
        end
      else
        new_num = @alphabet.find_index(letter) + shift["D"]
        if new_num < 27
          changed_message << @alphabet[new_num]
        else
          until new_num < 27
            new_num -= 27
          end
          changed_message << @alphabet[new_num]
        end
      end
      letter_number += 1
    end
    changed_message.join
  end
end
