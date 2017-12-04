class DistanceCalculator
  class << self
    def steps number
      return 0 if number == 1
      rows = find_rows(number)
      previous_ending_number = (rows-2)**2
      middle_position = (rows/2) + 1
      first_middle = previous_ending_number + middle_position - 1
      middle_advance = rows - 1
      middle_positions = [first_middle, first_middle + middle_advance, first_middle + (middle_advance*2), first_middle + (middle_advance*3) ]

      distances = middle_positions.map{|pos| (number - pos).abs}
      shortest_distance = distances.sort.first
      shortest_distance + middle_position - 1
    end

    def find_rows number
      sqrt = Math.sqrt(number).ceil
      return sqrt.odd? ? sqrt : sqrt+1
    end
  end
end
