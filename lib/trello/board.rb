module Trello
  class Board
    attr_accessor :data, :lists, :cards

    def initialize(boardid:)
      @cards = []
      @api   = Trello::Api.new
      @data  = @api.create_board(boardid)
      # let's get list of the board's lists
      @lists = @api.get_lists(data['id'])
    end

    def create_card!(title:, description:, list_id:)
      # choose list by name
      list = lists.select { |l| l['name'] == list_id }[0]
      card = @api.create_card({ title: title, description: description, list_id: list['id'] })
      @cards << card
    end
  end
end
