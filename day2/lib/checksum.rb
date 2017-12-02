class Checksum
  class << self
    def get_difference row
      numbers = row.split(' ').map(&:to_i)
      min = numbers.sort.first
      max = numbers.sort.last
      max-min
    end

    def add_numbers numbers
      return 0 if numbers.empty?
      numbers.reduce(&:+)
    end

    def calculate_checksum spreadsheet
      differences = []
      spreadsheet.each_line do |row|
        differences << Checksum.get_difference(row)
      end
      Checksum.add_numbers differences
    end
  end
end
