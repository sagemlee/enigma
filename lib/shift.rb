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






  # def encrypt(message)
  #   message_array = message.split(//)
  #   bloop = {}
  #   lou = message_array.each_with_index do |item, index|
  #     bloop[item] = index
  #   end
  #     binding.pry
  #   message_array.map do |letter|
  #     message_array.find_index(letter)
  #   end
  #   new_indexes = message_array.map do |letter|
  #     if message_array.find_index(letter) == 0 || message_array.find_index(letter).modulo(4) == 0
  #       @alphabet.find_index(letter) + shift["A"]
  #     elsif message_array.find_index(letter) == 1 || message_array.find_index(letter).modulo(4) == 1
  #     @alphabet.find_index(letter) + shift["B"]
  #     elsif message_array.find_index(letter) == 2 || message_array.find_index(letter).modulo(4) == 2
  #       @alphabet.find_index(letter) + shift["C"]
  #     else
  #       @alphabet.find_index(letter) + shift["D"]
  #     end
  #   end
  #   bob = new_indexes.map do |index|
  #     if index < 27
  #       alphabet_hash[index]
  #     else
  #       low_num = index
  #       until low_num < 27
  #         low_num -= 27
  #       end
  #       alphabet_hash[low_num]
  #     end
  #   end
  #   bob.join
  # end
  #   new_letters = new_indexes.map do |number|
  #     if number < 27
  #       @alphabet.find do |letter|
  #         @alphabet.find_index(letter) == number
  #       end
  #     else
  #       low_num = number
  #       until low_num < 27
  #         low_num -= 27
  #       end
  #       @alphabet.find do |letter|
  #         @alphabet.find_index(letter) == low_num
  #       end
  #     end
  #   end
  #   new_letters.to_h do |letter|
  #     [new_letters.find_index(letter), letter]
  #   end
  # end
  #
  # def encrypt(message)
  #
  #   message.split(//).map do |letter|
  #     new_alphabet[@alphabet.find_index(letter)]
  #   end
  # end

end
