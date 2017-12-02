class NumberCounter
  class << self
    def get_numbers(numbers_array, advance=1)
      return_numbers = []
      size = numbers_array.size
      numbers_array.each_with_index do |number, index|
        next_number = numbers_array[(index+advance) % size]
        return_numbers << number if number == next_number
      end
      return_numbers
    end

    def add_numbers(numbers_array)
      return 0 if numbers_array.empty?
      numbers_array.reduce(&:+)
    end
  end
end
