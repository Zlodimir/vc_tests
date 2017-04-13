module Trello
  class Api
    ENDPOINT = 'https://trello.com/1'

    def initialize
      credentials = YAML.load_file("#{Rails.root.to_s}/.trellorc")
      @auth = { key: credentials['developer_public_key'], token: credentials['member_token'] }
    end

    def create_board(name)
      begin
        response = RestClient.post "#{ENDPOINT}/boards/", @auth.merge(name: name)
      rescue RestClient::Unauthorized, RestClient::Forbidden => err
        puts 'Access denied'
        return err.response
      else
        parse(response)
      end
    end

    def create_list(name, board_id)
      response = RestClient.post "#{ENDPOINT}/lists/", @auth.merge(idBoard: board_id, name: name)
      parse(response)
    end

    def create_card(params = {})
      response = RestClient.post "#{ENDPOINT}/cards/", @auth.merge(idList: params[:list_id], name: params[:title], desc: params[:description])
      parse(response)
    end

    def get_lists(board_id)
      response = RestClient.get "#{ENDPOINT}/boards/#{board_id}/lists", params: @auth
      parse(response)
    end

    private

    def parse(data)
      JSON.parse(data)
    end
  end
end
