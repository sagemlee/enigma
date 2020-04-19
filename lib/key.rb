#initialize with random number as argument
#methods for A-D keys
class Key
  attr_reader :alphabet
  def initialize
    @alphabet = ("a".."z").to_a << " "
  end
end
