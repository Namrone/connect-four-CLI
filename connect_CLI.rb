class ConnectFour
  attr_accessor :board, :columns

  def initialize
    @board = Array.new(6,Array.new(7,"\u25EF"))
    @columns = (1..7).to_a
  end

  def files_convert(file)
    columns.index(file)
  end

  def get_placement
    
  end

  def verify_placement(coords)
    unless columns.include?(coords)
      puts "Column for placement was invalid. Please enter a valid column (1-7)"
      return
    end

    board.each do |row|
      if row[coords] == "\u25EF"
        return true
      end
    end

    puts "Column already full. Please try again"
  end
end