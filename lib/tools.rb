module Tools
  class Luhn
    def initialize(str)
      @stripped = str.delete(' ')
    end

    def valid?
      # Validations
      return false if @stripped.length <= 1
      return false if /\D/.match?(@stripped)

      # Calculation
      (rest_of_the_elements + checksum).sum % 10 == 0
    end

    private

    def checksum
      every_second_digit_from_right.map do |elem|
        double = elem * 2
        double > 9 ? double - 9 : double
      end
    end

    def every_second_digit_from_right
      indexes(1).map { |i| reversed_array[i].to_i }
    end

    def rest_of_the_elements
      indexes.map { |i| reversed_array[i].to_i }
    end

    def reversed_array
      @stripped.reverse.chars
    end

    def indexes(inx = 0)
      (inx..@stripped.length - 1).step(2)
    end
  end
end
