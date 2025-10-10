require_relative '../connect_CLI'
describe ConnectFour do
  describe '#initialize' do
    context 'initialize the correct size board' do
      subject(:game){described_class.new}      
      it 'is 7 slots in a row' do
        circle = "\u25EF"
        expect(game.board[1]).to eq([circle,circle,circle,circle,circle,circle,circle])
      end

      it 'is 6 rows total' do
        expect(game.board.length).to eq(6)
      end
    end

    context 'initialize the identifier for the ranks/files of the board' do
      subject(:game){described_class.new}   
      it 'the files for the board should display a-g' do
        expect(game.files).to eq(['A','B','C','D','E','F','G'])
      end

      it 'the ranks for the board should display 1-6' do
        expect(game.ranks).to eq([1,2,3,4,5,6])
      end
    end
  end

  describe '#convert files' do
    context 'convert the files location in alphabetic form and converts to numeric' do
      subject(:game){described_class.new}
      it 'converts A to 0' do
        expect(game.files_convert('A')).to eq(0)
      end

      it 'converts G to 6' do
        expect(game.files_convert('G')).to eq(6)
      end
    end

    context 'returns nil for something besies A-G entry' do
      subject(:game){described_class.new}
      it 'returns P to nil' do
        expect(game.files_convert('P')).to be_falsey
      end

      it 'returns 3 to nil' do
        expect(game.files_convert(3)).to be_falsey
      end
    end
  end
end