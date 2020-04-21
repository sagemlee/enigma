require './lib/enigma'

handle = File.open(ARGV[0], "r")
handle_2 = ARGV[2]
handle_3 = ARGV[3]

incoming_text = handle.read
incoming_key = handle_2
incoming_date = handle_3

handle.close

enigma = Enigma.new
update = enigma.decrypt(incoming_text, incoming_key, incoming_date)
decrypted_text = update[:decryption]

puts "Created 'decrypted.txt' with the key #{incoming_key} and date #{incoming_date}"

writer = File.open(ARGV[1], "w")

writer.write(decrypted_text)

writer.close
