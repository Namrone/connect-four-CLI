require_relative 'connect_CLI'

class CLIInterface
  def initialize(game)
    @game = game
  end

  def print_board
    puts `clear`
    row = 5
    puts "~~~~ Connect Four ~~~~"
    puts "   Player #{@game.players.index(@game.current_player)+1}'s turn"
    until row < 0
      print "|"
      @game.board[row].each do |cell|
        print " #{cell} "
      end
      puts "|"
      row -= 1
    end
  end
end