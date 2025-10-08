describe 'CLI print out' do
  context 'print out the correct size board' do
    before do
      
    end
    
    xit 'is 7 slots in a row' do
      circle = "\u25EF"
      expect(row).to eq([circle,circle,circle,circle,circle,circle,circle])
    end

    xit 'is 6 rows total' do
      expect(board.length).to eq(6)
    end
  end

  context 'print out the identifier for the ranks/files of the board' do
    xit 'the files for the board should display a-g' do
      expect(files).to eq([a,b,c,d,e,f,g])
    end

    xit 'the ranks for the board shoudl display 1-6' do
      expect(ranks).to eq([1,2,3,4,5,6])
    end
  end
end