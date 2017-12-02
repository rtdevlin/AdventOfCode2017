class Checksum
  class << self

    def get_evenly_divisible_quotient row
      numbers = row.split(' ').map(&:to_i)
      sorted_numbers = numbers.sort.reverse
      first_number = sorted_numbers.delete_at(0)
      sorted_numbers.each do |number|
        return (first_number / number) if (first_number % number == 0)
      end
      get_evenly_divisible_quotient sorted_numbers.join(' ')
    end

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

    def calculate_quotient_checksum spreadsheet
      numbers_to_add = []
      spreadsheet.each_line do |row|
        numbers_to_add << Checksum.get_evenly_divisible_quotient(row)
      end
      Checksum.add_numbers numbers_to_add
    end

    def calculate_difference_checksum spreadsheet
      numbers_to_add = []
      spreadsheet.each_line do |row|
        numbers_to_add << Checksum.get_difference(row)
      end
      Checksum.add_numbers numbers_to_add
    end
  end
end
