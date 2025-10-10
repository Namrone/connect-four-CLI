class ConnectFour
  attr_accessor :board, :ranks, :files

  def initialize
    @board = (1..6).to_h {|i| [i,Array.new(7,"\u25EF")]}
    @ranks = [1,2,3,4,5,6]
    @files = ['A','B','C','D','E','F','G']
  end

  def files_convert(file)
    files.index(file)
  end
end