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

    context 'initialize the identifier for the columns of the board' do
      subject(:game){described_class.new}   
      it 'the files for the board should display a-g' do
        expect(game.columns).to eq([1,2,3,4,5,6,7])
      end
    end
  end

  describe '#convert columns' do
    context 'convert the entered column to the index' do
      subject(:game){described_class.new}
      it 'converts 1 to 0' do
        expect(game.files_convert(1)).to eq(0)
      end

      it 'converts 7 to 6' do
        expect(game.files_convert(7)).to eq(6)
      end
    end
  end

  describe '#verify placement' do
    context 'when a player inputs correct placement' do
      subject(:game){described_class.new}
      it 'returns true' do
        expect(game.verify_placement(2)).to eq(true)
      end
    end

    
    context 'when the column is full/invalid' do
      subject(:game){described_class.new}
      it 'outputs error message when coords are out of range' do
        expect{game.verify_placement(nil)}.to output("Column for placement was invalid. Please enter a valid column (1-7)\n").to_stdout
      end

      it 'outputs error message when the column is full of placements' do
        game.board.each do |row|
          row[2] = "X"
        end
        expect{game.verify_placement(2)}.to output("Column already full. Please try again\n").to_stdout
      end
    end
  end
end