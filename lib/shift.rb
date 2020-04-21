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

  def rotate_by_shift(letter)
    rotated_hash = Hash.new
    @alphabet.rotate(shift[letter]).each_with_index do |letter, index|
      rotated_hash[letter] = index
    end
    rotated_hash.invert
  end

  def alphabet_hash
    alphabet_index = Hash.new
    @alphabet.each_with_index do |letter, index|
      alphabet_index[letter] = index
    end
    alphabet_index
  end

  def encrypt(message)
    message_array = message.downcase.split(//)
    letter_number = 0
    changed_message = []

    message_array.map do |letter|
      if (letter_number == 0 || letter_number.modulo(4) == 0) && alphabet_hash[letter] != nil
        changed_message << rotate_by_shift("A")[alphabet_hash[letter]]
      elsif (letter_number == 1 || letter_number.modulo(4) == 1) && alphabet_hash[letter] != nil
        changed_message << rotate_by_shift("B")[alphabet_hash[letter]]
      elsif (letter_number == 2 || letter_number.modulo(4) == 2) && alphabet_hash[letter] != nil
        changed_message << rotate_by_shift("C")[alphabet_hash[letter]]
      elsif alphabet_hash[letter] != nil
        changed_message << rotate_by_shift("D")[alphabet_hash[letter]]
      else
        changed_message << letter
      end
      letter_number += 1
    end
    changed_message.join
  end

  def rotate_back_by_shift(letter)
    rotated_hash = Hash.new
    @alphabet.rotate(-(shift[letter])).each_with_index do |letter, index|
      rotated_hash[letter] = index
    end
    rotated_hash.invert
  end

  def decrypt(message)
    message_array = message.downcase.split(//)
    letter_number = 0
    changed_message = []
    
    message_array.map do |letter|
      if (letter_number == 0 || letter_number.modulo(4) == 0) && alphabet_hash[letter] != nil
        changed_message << rotate_back_by_shift("A")[alphabet_hash[letter]]
      elsif (letter_number == 1 || letter_number.modulo(4) == 1) && alphabet_hash[letter] != nil
        changed_message << rotate_back_by_shift("B")[alphabet_hash[letter]]
      elsif (letter_number == 2 || letter_number.modulo(4) == 2) && alphabet_hash[letter] != nil
        changed_message << rotate_back_by_shift("C")[alphabet_hash[letter]]
      elsif alphabet_hash[letter] != nil
        changed_message << rotate_back_by_shift("D")[alphabet_hash[letter]]
      else
        changed_message << letter
      end
      letter_number += 1
    end
    changed_message.join
  end

end
