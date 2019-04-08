class Board
  def initialize
    @items = Array.new(9, " ")
  end
  def fill(sym, index)
    return false if @items[index-1].is_a? Symbol
    @items[index-1] = sym
    show
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