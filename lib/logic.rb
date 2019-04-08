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

class Game
  WIN_POS = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  def initialize
    @players = {}
    @moves = 0
    @board = Board.new
  end
  def add_player(role, name)
    return false if @players[role]
    @players[role] = Player.new(name)
    @current_role = 1 if role == 1
    return true
  end
  def next_move(cell)
    return -1 unless pos(cell)
    return 0 unless @board.fill(sym(@current_role), pos(cell))
    @players[@current_role].next_move(pos(cell))
    @moves += 1
    check_winner
    @current_role = @current_role == 1 ? 2 : 1
  end
end
