require './test/test_helper'

keysets = KeyGenerator.new
offsets = Offsets.new
cipher =Cipher.new(keysets, offsets)
decipher = Decipher.new(keysets, offsets)
enigma = Enigma.new(cipher, decipher)

message = File.open(ARGV[0], 'r')
encrypt = ''
message.each do |line|
  encrypt += enigma.encrypt(line.chop)[:encryption] + "\n"
end

output = File.open(ARGV[1], 'w')
output.write(encrypt)

puts "key: #{enigma.cipher.key} & date: #{enigma.cipher.date}"
