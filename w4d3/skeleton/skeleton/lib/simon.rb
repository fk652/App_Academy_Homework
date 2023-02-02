require "colorize"

class Simon
  COLORS = %w(red blue green yellow)
  COLOR_MAP = {
    "red" => :blue,
    "blue" => :yellow,
    "green" => :red,
    "yellow" => :green
  }
  COLORIZERS = [ 
    :blue, 
    :yellow, 
    :green, 
    :red,

    :black,
    :cyan,
    :magenta,
    :white,
    :light_black,
    :light_blue,
    :light_green,
    :light_cyan,
    :light_red,
    :light_magenta,
    :light_yellow,
    :light_white
  ]

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 0
    @game_over = false
    @seq = []
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if !@game_over
      round_success_message 
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    system("clear")
    sleep(1)
    @seq.each do |color|
      # puts color.colorize(COLOR_MAP[color])
      # puts color.colorize(COLORIZERS.sample)
      puts color.colorize(:color => COLORIZERS.sample, :background => COLORIZERS.sample)
      sleep(0.5)
      system("clear")
      sleep(0.5)
    end
  end

  def require_sequence
    puts "input a sequence"
    user_seq = gets.chomp.split(' ')
    @game_over = true if user_seq != @seq
  end

  def add_random_color
    random_color = COLORS.sample
    @seq.push(random_color)
  end

  def round_success_message
    puts "\nCORRECT!"
    sleep(2)
  end

  def game_over_message
    system("clear")
    sleep(1)
    puts "GAME OVER"
    # colorized_seq = @seq.map { |color| color.colorize(COLOR_MAP[color])}.join(' ')
    colorized_seq = @seq.map { |color| color.colorize(COLORIZERS.sample)}.join(' ')
    puts "Final Sequence:\n#{colorized_seq}"
    puts "Final Score: #{@sequence_length}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

simon = Simon.new
simon.play