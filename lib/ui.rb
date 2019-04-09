# UI
class UI
  def initialize(game)
    @game = game
    @board = Board.new
  end

  def credit
    puts <<-HEREDOC
    \t\t\t\t ********************************
    \t\t\t\t *       TIC-TAC-TOE GAME       *
    \t\t\t\t * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *
    \t\t\t\t *        FABIEN/DARSHAN        *
    \t\t\t\t ********************************
    HEREDOC
  end

  def start
    credit
    print "\n\n--> Player 1: #{@game.add_player(1, gets.chomp)}"
    print "\n--> Player 2: #{@game.add_player(2, gets.chomp)}"
    puts "---------------------\n"\
      'Choose cell to fill using colum_index as a1 or 1a | b2 or 2b, ...'
    iterate
  end

  def fill(sym, index)
    @board.fill(sym, index)
  end

  def iterate
    loop do
      print "\n#{@game.current_player.name} move --> "
      input = gets.chomp
      case next_move(input)
      when :wrong then puts "\n\t!! #{input} is invalid move !!"
      when :filled then puts "\n\t!! #{input} is already filled !!"
      end
    end
  end

  def winner
    puts "\n\t\t\t\t*************** #{@game.current_player.name} "\
      'wins! ***************' if win
      restart?
  end

  def draw
    puts "\n    \t\t\t~~ Draw game! It was a very tight battle. ~~" if draw
    restart?
  end

  def restart?
    print "\n Do you want to play again? (y if yes, n if not): "
    if gets.chomp.downcase == 'y'
      @game.restart
    else
      @game.stop
    end
  end
end

# A grid showing the moves of players
class Board
  def initialize
    @items = Array.new(9, ' ')
  end

  def fill(sym, index)
    return false if @items[index - 1].is_a? Symbol

    @items[index - 1] = sym
    true
  end

  def show
    puts <<-HEREDOC
    \t\t\t\t\t     A   B   C
    \t\t\t\t\t   -------------
    \t\t\t\t\t 1 | #{@items[0]} | #{@items[1]} | #{@items[2]} |
    \t\t\t\t\t   -------------
    \t\t\t\t\t 2 | #{@items[3]} | #{@items[4]} | #{@items[5]} |
    \t\t\t\t\t   -------------
    \t\t\t\t\t 3 | #{@items[6]} | #{@items[7]} | #{@items[8]} |
    \t\t\t\t\t   -------------
    HEREDOC
  end
end