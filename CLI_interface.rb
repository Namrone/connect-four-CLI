require_relative 'connect_CLI'

class CLIInterface
  def initialize
    @game = ConnectFour.new(self)
  end

  def print_board
    print `clear`
    row = 5
    puts "      ~~~~ Connect Four ~~~~"
    puts "         Player #{@game.players.index(@game.current_player)+1}'s turn"
    until row < 0
      print "     |"
      @game.board[row].each do |cell|
        print " #{cell} "
      end
      puts "|"
      row -= 1
    end
    puts "row #: #{@game.columns.join("  ")}"
    print "\nEnter the row # you would like to place: "
  end

  def out_of_range
    print_board
    print "Column for placement was invalid. Please enter a valid column (1-7): "
  end

  def column_full
    print_board
    print "Column already full. Please try again: "
  end

  def win_screen
    row = 5
    print `clear`
    puts "   ~~~~ Winner is Player #{@game.players.index(@game.current_player)+1} ~~~~"
    until row < 0
      print "     |"
      @game.board[row].each do |cell|
        print " #{cell} "
      end
      puts "|"
      row -= 1
    end

    puts "row #: #{@game.columns.join("  ")}"
  end

  def play_game
    loop do
      print_board
      @game.get_placement
      break if @game.end_game?
      @game.swap_player
    end
    win_screen
  end
end