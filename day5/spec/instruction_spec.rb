require File.expand_path("../../lib/instruction.rb", __FILE__)
require 'pry'

describe Instruction do
  subject { Instruction.new(0, 3, 0, 1, -3) }
  context '#steps' do
    it 'will output the number of steps it takes to leave the maze of jump instructions' do
      expect(subject.steps).to eq 5
    end
  end
  context '#weird_steps' do
    it 'will output the number of steps it takes to leave the maze of jump instructions' do
      expect(subject.weird_steps).to eq 10
    end
  end

  context '#reset_position' do
    it 'will set current position to 0' do
      subject.current_position = 100
      subject.reset_position
      expect(subject.current_position).to eq 0
    end
  end
end
