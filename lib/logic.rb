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
