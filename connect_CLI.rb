class ConnectFour
  attr_accessor :board, :columns

  def initialize
    @board = Array.new(6,Array.new(7,"\u25EF"))
    @columns = (1..7).to_a
  end

  def files_convert(file)
    columns.index(file)
  end

  def get_coordinates
    
  end

  def verify_coordinates(coords)
    
  end
end