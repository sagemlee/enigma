handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

puts "Created 'encrypted.txt' with the key 82648 and date 240818"

decrypted_text = incoming_text.upcase

writer = File.open(ARGV[1], "w")

writer.write(capitalized_text)

writer.close
