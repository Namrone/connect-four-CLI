class ConnectFour
  attr_accessor :board, :columns, :round, :player_turn

  def initialize
    @board = Array.new(6,Array.new(7,"\u25EF"))
    @columns = (1..7).to_a
    @round = 0
    @players = ["\u26D2","\u26AB"]
    @current_player = "\u26D2"
    @most_recent_move = nil
  end

  def files_convert(file)
    columns.index(file)
  end

  def get_placement
    until verify_placement(gets.chomp.to_i)
    end
  end

  def verify_placement(coords)
    unless columns.include?(coords)
      puts "Column for placement was invalid. Please enter a valid column (1-7)"
      return
    end

    board.each do |row|
      if row[coords] == "\u25EF"
        row[coords] = @current_player
        @round += 1
        return true
      end
    end

    puts "Column already full. Please try again"
  end

  def swap_player
    @current_player = @players[round%2]
  end

  def end_game?
    
  end

  def row_check?(play)
    repeats = 0
    prev_cell = "\u26D2"
    @board[play[0]].each do |cell|
      if cell == "\u26D2"
        repeats = 0
      elsif prev_cell == cell
        repeats += 1
      else
        repeats = 1
      end
      return true if repeats == 4
      prev_cell = cell
    end
    return false
  end
end