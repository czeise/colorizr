# Re-opening the string class to add the Colorizr methods
class String
  COLORS = {
    red: 31,
    green: 32,
    yellow: 33,
    blue: 34,
    # 35 is the code for magenta. People in the know tell me that magenta is
    # pretty much the same as pink...
    pink: 35,
    light_blue: 94,
    white: 97,
    light_grey: 37,
    black: 30
  }

  def self.create_colors
    COLORS.each do |color, code|
      send(:define_method, "#{color}") do
        "\e[#{code}m#{self}\e[0m"
      end
    end
  end

  def self.colors
    COLORS.keys
  end

  def self.sample_colors
    COLORS.each_key do |color|
      puts 'This is ' + "#{color}".send(color)
    end
  end
end

String.create_colors
