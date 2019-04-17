require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'
require './lib/keys_generator'
require './lib/offsets'
require './lib/cipher'
require './lib/decipher'
require './lib/enigma'
require 'pry'
keysets = KeyGenerator.new
offsets = Offsets.new
cipher =Cipher.new(keysets, offsets)
decipher = Decipher.new(keysets, offsets)
enigma = Enigma.new(cipher, decipher)

message = File.open(ARGV[0], 'r')
decrypt = ''
message.each do |line|
  decrypt += enigma.decrypt(line.chop, ARGV[2], ARGV[3])[:decryption] + "\n"
end

output = File.open(ARGV[1], 'w')
output.write(decrypt)
