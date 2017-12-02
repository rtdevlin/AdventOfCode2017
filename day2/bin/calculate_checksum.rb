require File.expand_path('../../lib/checksum.rb', __FILE__)

input1 = File.read(File.expand_path('../../input/input1.dat', __FILE__))

puts Checksum.calculate_difference_checksum(input1)

input2 = File.read(File.expand_path('../../input/input2.dat', __FILE__))

puts Checksum.calculate_quotient_checksum(input2)

