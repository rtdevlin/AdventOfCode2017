class Instruction
  attr_accessor :instructions, :current_position
  def initialize(*instructions)
    @instructions = instructions
    @current_position = 0
  end

  def steps
    steps = 0
    instructions_copy = instructions.dup
    while self.current_position < instructions.size
      advance = instructions_copy[current_position]
      instructions_copy[current_position] += 1
      self.current_position += advance
      steps += 1
    end
    steps
  end

  def reset_position
    self.current_position = 0
  end

  def weird_steps
    steps = 0
    instructions_copy = instructions.dup
    while self.current_position < instructions.size
      advance = instructions_copy[current_position]
      instructions_copy[current_position] += advance > 2 ? -1 : 1
      self.current_position += advance
      steps += 1
    end
    steps
  end
end
