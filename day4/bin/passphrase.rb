require File.expand_path("../../lib/passphrase.rb", __FILE__)

input_path = File.expand_path("../../input/input1.dat", __FILE__)
input = File.open(input_path).readlines

count = 0

input.each do |phrase|
  phrase = Passphrase.new(phrase)
  count += 1 if phrase.valid?
end
puts count

count = 0

input.each do |phrase|
  phrase = Passphrase.new(phrase)
  count += 1 if phrase.super_valid?
end
puts count
