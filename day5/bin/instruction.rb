require File.expand_path("../../lib/instruction.rb", __FILE__)

input_path = File.expand_path("../../input/input1.dat", __FILE__)

input = File.open(input_path).readlines.map(&:to_i)

instructions = Instruction.new(*input)

puts instructions.steps
instructions.reset_position
puts instructions.weird_steps
