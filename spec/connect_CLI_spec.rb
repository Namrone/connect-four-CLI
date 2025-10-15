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
      it 'increases the round count' do
        game.verify_placement(2)
        expect(game.round).to eq(1)
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

  describe '#get placement' do
    context 'when a player enters an appropriate entry' do
      subject(:game){described_class.new}
      it "doesn't loop" do
        valid_input = "3\n"
        allow(game).to receive(:gets).and_return(valid_input)
        game.get_placement
        expect(game).to have_received(:gets).once
      end
    end
  end

  describe '#swap player' do
    context 'When a player enters a valid column then swaps to the other player' do
      subject(:game){described_class.new}
      it 'switches to the next player' do
        game.verify_placement(2)
        expect(game.swap_player).to eq("\u26AB")
      end
    end
  end

  
  describe '#row check?' do
    context 'When there is no 4 in a row then the game continues and returns false' do
      subject(:game){described_class.new}
      it 'checks row with only 2 of the same' do
        game.board[2][2] = "\u26D2"
        game.board[2][3] = "\u26D2"
        expect(game.row_check?([2,3])).to be_falsey
      end
    end
  end

  describe '#column check?' do
    context 'When there is no 4 in a row then the game continues and returns false' do
      subject(:game){described_class}
      xit 'checks column with 0 of the same' do
        expect(game.end_game?([2,3])).to be_falsey
      end
    end
  end

  describe '#diagonal check check?' do
    context 'When there is no 4 in a row then the game continues and returns false' do
      subject(:game){described_class}
      xit 'checks bottom left to top right with 3 of the same' do
        game.board[2][2] = "\u26AB"
        game.board[3][3] = "\u26AB"
        game.board[4][4] = "\u26AB"
        expect(game.end_game?([3,3])).to be_falsey
      end
    end
  end

  describe '#cross check check?' do
    context 'When there is no 4 in a row then the game continues and returns false' do
      xit 'checks bottom right to top left 1 of the same' do
        game.board[2][2] = "\u26AB"
        expect(game.end_game?([2,2])).to be_falsey
      end
    end
  end

  describe '#end game?' do
  end
end