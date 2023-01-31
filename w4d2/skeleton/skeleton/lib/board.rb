class Board
  attr_reader :name1, :name2
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(12) { Array.new(4, :stone) }
    @cups.insert(6, [])
    # @cups.insert(13, [])
    @cups << []
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 13
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos].slice!(0, cups.length)
    opponent_store = (name1 == current_player_name ? 13 : 6)
    cup_idx = start_pos
    until stones.empty?
      cup_idx = (cup_idx + 1) % 14
      cups[cup_idx] << stones.pop if cup_idx != opponent_store
    end
    render
    return next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if cups[ending_cup_idx].length == 1
    return ending_cup_idx if cups[ending_cup_idx].length > 0
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all?(&:empty?) || cups[7..12].all?(&:empty?)
  end

  def winner
    return :draw if cups[6].length == cups[13].length
    cups[6].length > cups[13].length ? name1 : name2
  end
end
