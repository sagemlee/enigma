require './lib/enigma'
require 'pry'

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

enigma = Enigma.new
update = enigma.encrypt(incoming_text)
encrypted_text = update[:encryption]
key = update[:key]
date = update[:date]

puts "Created 'encrypted.txt' with the key #{key} and date #{date}"


writer = File.open(ARGV[1], "w")

writer.write(encrypted_text)

writer.close
