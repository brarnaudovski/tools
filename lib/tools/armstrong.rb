module Tools
  class Armstrong
    def initialize(number)
      @number = number
    end

    def valid?
      sum == number
    end

    private

    def sum
      digits.sum { |digit| digit**size }
    end

    def number
      @number.abs
    end

    def digits
      number.digits
    end

    def size
      digits.size
    end
  end
end
