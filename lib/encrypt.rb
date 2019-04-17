require './test/test_helper'

keysets = KeyGenerator.new
offsets = Offsets.new
cipher =Cipher.new(keysets, offsets)
decipher = Decipher.new(keysets, offsets)
enigma = Enigma.new(cipher, decipher)

message = File.open("./lib/#{ARGV[0]}", 'r')
encrypt = ''
message.each do |line|
  encrypt += enigma.encrypt(line.chop)[:encryption] + "\n"
end

output = File.open("./lib/#{ARGV[1]}", 'w')
output.write(encrypt)

puts "Created 'encrypted.txt' with the key: #{enigma.cipher.key} and date: #{enigma.cipher.date}"
