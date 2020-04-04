module Tools
  class Resistors
    COLORS = {
      black: {
        color: 0,
        multiplier: 1,
        tolerance: 20
      },
      brown: {
        color: 1,
        multiplier: 10,
        tolerance: 1
      },
      red: {
        color: 2,
        multiplier: 100,
        tolerance: 2
      },
      orange: {
        color: 3,
        multiplier: 1000,
        tolerance: 0.05
      },
      yellow: {
        color: 4,
        multiplier: 10_000,
        tolerance: 0.02
      },
      green: {
        color: 5,
        multiplier: 100_000,
        tolerance: 0.5
      },
      blue: {
        color: 6,
        multiplier: 1_000_000,
        tolerance: 0.25
      },
      violet: {
        color: 7,
        multiplier: 10_000_000,
        tolerance: 0.10
      },
      gray: {
        color: 8,
        multiplier: 100_000_000,
        tolerance: 0.05
      },
      white: {
        color: 9,
        multiplier: 1_000_000_000,
        tolerance: 10
      },
      gold: {
        multiplier: 0.1,
        tolerance: 5
      },
      silver: {
        multiplier: 0.01,
        tolerance: 10
      }
    }.freeze

    def initialize(colors)
      @color_1, @color_2, @multiplier, @tolerance = colors
    end

    def specification
      "#{base * multiplier} ohms +/-#{tolerance}%"
    end

    private

    def multiplier
      COLORS.dig @multiplier.downcase.to_sym, :multiplier
    end

    def tolerance
      @tolerance.nil? ? 20 : COLORS.dig(@tolerance.downcase.to_sym, :tolerance)
    end

    def color_1
      color(@color_1) * 10
    end

    def color_2
      color(@color_2)
    end

    def base
      color_1 + color_2
    end

    def color(color_key)
      COLORS.dig color_key.downcase.to_sym, :color
    end
  end
end
