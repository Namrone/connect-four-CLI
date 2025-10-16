class ConnectFour
  attr_accessor :board, :columns, :round, :player_turn, :players, :current_player

  def initialize(cli)
    @cli = cli
    @board = Array.new(6){Array.new(7,"\u25EF")}
    @columns = (1..7).to_a
    @round = 0
    @players = ["\u26D2","\u2689"]
    @current_player = "\u26D2"
    @most_recent_move = nil
    @coords = Array.new(2)
  end

  def convert_placement(entry)
    @columns.index(entry)
  end

  def get_placement
    until verify_placement(gets.chomp.to_i)
    end
  end

  def verify_placement(placement)
    unless columns.include?(placement)
      @cli.out_of_range
      return
    end

    placement = convert_placement(placement)

    board.each_with_index do |row,index|
      if row[placement] == "\u25EF"
        row[placement] = @current_player
        @round += 1
        @coords = [placement,index]
        return true
      end
    end

    @cli.column_full
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

    until ranks < 0 || file < 0
      cells_arr.prepend(@board[ranks][file])
      file -= 1
      ranks -= 1
    end

    file = play[0]
    ranks = play[1]
    
    until file >= 6 || ranks >= 5
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

    until file < 0 || ranks > 5
      cells_arr.prepend(@board[ranks][file])
      ranks += 1
      file -= 1
    end

    file = play[0]
    ranks = play[1]

    until ranks <= 0 || file >= 6
      ranks -= 1
      file += 1
      cells_arr << @board[ranks][file]
    end

    cells_arr
  end

  def four_in_a_row?(cells_arr)
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

  def end_game?
    return true if four_in_a_row?(row_arr(@coords)) || four_in_a_row?(column_arr(@coords)) || four_in_a_row?(diagonal_arr(@coords)) || four_in_a_row?(cross_arr(@coords))
    
    false
  end
end