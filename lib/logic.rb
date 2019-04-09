require_relative "./ui.rb"

# LOGIC
# Store the player informations
class Player
  attr_reader :name
  def initialize(name)
    @name = name
    @moves = Move.new
  end

  def next_move(pos)
    @moves.next(pos)
  end

  def moves
    @moves.get
  end
end

# Track the players move
class Move
  def initialize
    @track = []
  end

  def next(pos)
    @track.push(pos)
  end

  def get
    @track
  end
end

# Represent the game functionality
class Game
  WIN_POS = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
    [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]
  ].freeze
  def initialize
    @players = {}
    @moves = 0
    @ui = UI.new(self)
  end

  def add_player(role, name)
    return false if @players[role]

    @players[role] = Player.new(name)
    @current_role = 1 if role == 1
    true
  end

  def current_player
    @players[@current_role]
  end

  def next_move(cell)
    return :wrong unless pos(cell)

    return :filled unless @ui.fill(sym(@current_role), pos(cell))

    @players[@current_role].next_move(pos(cell))
    @moves += 1
    end? = end_game?(check_winner)
    @current_role = @current_role == 1 ? 2 : 1
    end?
  end

  def check_winner
    WIN_POS.each do |item|
      win = (item & @players[@current_role].moves).length == 3
      return @players[@current_role] if win
    end
    nil
  end

  def start
    @ui.start
  end

  def restart
    initialize
    start
  end

  def stop
    puts "\n\t\t\t\t----> See you next time! <----\n"
    exit
  end

  def end_game?(winner)
    if winner
      @ui.winner
      return winner
    end
    if @moves == 9
      @ui.draw
      return :draw
    end
    false
  end

  private

  def sym(role)
    case role
    when 1
      :X
    when 2
      :O
    end
  end

  def pos(cell)
    {
      'a1' => 1, '1a' => 1, 'a2' => 4, '2a' => 4, 'a3' => 7, '3a' => 7,
      'b1' => 2, '1b' => 2, 'b2' => 5, '2b' => 5, 'b3' => 8, '3b' => 8,
      'c1' => 3, '1c' => 3, 'c2' => 6, '2c' => 6, 'c3' => 9, '3c' => 9
    }[cell]
  end
end