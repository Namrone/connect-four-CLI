require_relative '../connect_CLI'
describe ConnectFour do
  describe '#initialize' do
    context 'print out the correct size board' do
      subject(:game){described_class.new}      
      it 'is 7 slots in a row' do
        circle = "\u25EF"
        expect(game.board[0]).to eq([circle,circle,circle,circle,circle,circle,circle])
      end

      it 'is 6 rows total' do
        expect(game.board.length).to eq(6)
      end
    end

    context 'print out the identifier for the ranks/files of the board' do
      subject(:game){described_class.new}   
      it 'the files for the board should display a-g' do
        expect(game.files).to eq(['A','B','C','D','E','F','G'])
      end

      it 'the ranks for the board shoudl display 1-6' do
        expect(game.ranks).to eq([1,2,3,4,5,6])
      end
    end
  end
end