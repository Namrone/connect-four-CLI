class ConnectFour
  attr_accessor :board, :ranks, :files

  def initialize
    @board = Array.new(6,["\u25EF","\u25EF","\u25EF","\u25EF","\u25EF","\u25EF","\u25EF"])
    @ranks = [1,2,3,4,5,6]
    @files = ['A','B','C','D','E','F','G']
  end
end