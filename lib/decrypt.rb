handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

puts incoming_text

capitalized_text = incoming_text.downcase

writer = File.open(ARGV[1], "w")

writer.write(capitalized_text)

writer.close
