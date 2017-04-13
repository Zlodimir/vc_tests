require 'rails_helper'

describe Trello::Board do
  before(:each) do
    @board_name = 'someid'
    @board      = Trello::Board.new(boardid: @board_name)
  end

  describe '.new method' do
    it "should have unique id of the board" do
      expect(@board.data['id']).not_to be_empty
    end

    it "should have the same name" do
      expect(@board.data['name']).to eq(@board_name)
    end
  end

  describe '.create_card! method' do
    it "should have unique id of the card and title" do
      @board.create_card!(title: 'some title', description: 'description', list_id: 'To Do')
      expect(@board.cards.first['id']).not_to be_empty
      expect(@board.cards.first['name']).to eq('some title')
    end
  end
end
