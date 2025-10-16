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

  def row_arr(play)
    @board[play[1]]
  end

  def column_arr(play)
    column = Array.new

    @board.each do |row|
      column << row[play[0]]
    end

    column
  end

  #creates array from bottom left to top right from last played location
  def diagonal_arr(play)
    cells_arr = Array.new

    file = play[0]
    ranks = play[1]

    until ranks < 0
      cells_arr.prepend(@board[ranks][file])
      file -= 1
      ranks -= 1
    end

    file = play[0]
    ranks = play[1]
    
    until file >= 5
      file += 1
      ranks += 1
      cells_arr << @board[ranks][file]
    end
    cells_arr
  end

  #creates array from bottom right to top left from last played location
  def cross_arr(play)
    cells_arr = Array.new

    file = play[0]
    ranks = play[1]

    until file < 0
      cells_arr.prepend(@board[ranks][file])
      ranks += 1
      file -= 1
    end

    file = play[0]
    ranks = play[1]

    until ranks <= 0
      ranks -= 1
      file += 1
      cells_arr << @board[ranks][file]
    end

    cells_arr
  end

  def end_game?(cells_arr)
    repeats = 0
    prev_cell = "\u25EF"

    cells_arr.each do |cell|
      if cell == "\u25EF"
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