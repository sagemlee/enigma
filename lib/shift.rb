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


  # def rotate_by_shift(letter)
  #   bob = Hash.new
  #   binding.pry
  #   @alphabet.rotate(shift["letter"]).each_with_index do |letter, index|
  #     bob[letter] = index
  #   end
  #   bob.invert
  # end

  def a_shift
    bob = Hash.new
    @alphabet.rotate(shift["A"]).each_with_index do |letter, index|
      bob[letter] = index
    end
    bob.invert
  end

  def b_shift
    bob = Hash.new
    @alphabet.rotate(shift["B"]).each_with_index do |letter, index|
      bob[letter] = index
    end
    bob.invert
  end

  def c_shift
    bob = Hash.new
    @alphabet.rotate(shift["C"]).each_with_index do |letter, index|
      bob[letter] = index
    end
    bob.invert
  end

  def d_shift
    bob = Hash.new
    @alphabet.rotate(shift["D"]).each_with_index do |letter, index|
      bob[letter] = index
    end
    bob.invert
  end




  def encrypt(message)
    alphabet_hash = Hash.new
    @alphabet.each_with_index do |letter, index|
      alphabet_hash[letter] = index
    end
    message_array = message.downcase.split(//)
    letter_number = 0
    changed_message = []
    message_array.map do |letter|
      if letter_number == 0 || letter_number.modulo(4) == 0
        if alphabet_hash[letter] != nil
          changed_message << a_shift[alphabet_hash[letter]]
        else
          changed_message << letter
        end
      elsif letter_number == 1 || letter_number.modulo(4) == 1
        if alphabet_hash[letter] != nil
          changed_message << b_shift[alphabet_hash[letter]]
        else
          changed_message << letter
        end
      elsif letter_number == 2 || letter_number.modulo(4) == 2
        if alphabet_hash[letter] != nil
          changed_message << c_shift[alphabet_hash[letter]]
        else
          changed_message << letter
        end
      else
        if alphabet_hash[letter] != nil
          changed_message << d_shift[alphabet_hash[letter]]
        else
          changed_message << letter
        end
      end
      letter_number += 1
    end
    changed_message.join

  end

  def a_back_shift
    bob = Hash.new
    @alphabet.rotate(-(shift["A"])).each_with_index do |letter, index|
      bob[letter] = index
    end
    bob.invert
  end

  def b_back_shift
    bob = Hash.new
    @alphabet.rotate(-(shift["B"])).each_with_index do |letter, index|
      bob[letter] = index
    end
    bob.invert
  end

  def c_back_shift
    bob = Hash.new
    @alphabet.rotate(-(shift["C"])).each_with_index do |letter, index|
      bob[letter] = index
    end
    bob.invert
  end

  def d_back_shift
    bob = Hash.new
    @alphabet.rotate(-(shift["D"])).each_with_index do |letter, index|
      bob[letter] = index
    end
    bob.invert
  end

  def decrypt(message)
    alphabet_hash = Hash.new
    @alphabet.each_with_index do |letter, index|
      alphabet_hash[letter] = index
    end
    message_array = message.downcase.split(//)
    letter_number = 0
    changed_message = []
    message_array.map do |letter|
      if letter_number == 0 || letter_number.modulo(4) == 0
        if alphabet_hash[letter] != nil
          changed_message << a_back_shift[alphabet_hash[letter]]
        else
          changed_message << letter
        end
      elsif letter_number == 1 || letter_number.modulo(4) == 1
        if alphabet_hash[letter] != nil
          changed_message << b_back_shift[alphabet_hash[letter]]
        else
          changed_message << letter
        end
      elsif letter_number == 2 || letter_number.modulo(4) == 2
        if alphabet_hash[letter] != nil
          changed_message << c_back_shift[alphabet_hash[letter]]
        else
          changed_message << letter
        end
      else
        if alphabet_hash[letter] != nil
          changed_message << d_back_shift[alphabet_hash[letter]]
        else
          changed_message << letter
        end
      end
      letter_number += 1
    end
    changed_message.join
  end

end
