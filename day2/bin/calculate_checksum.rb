require File.expand_path('../../lib/checksum.rb', __FILE__)

input1 = File.read(File.expand_path('../../input/input1.dat', __FILE__))

puts Checksum.calculate_checksum(input1)

