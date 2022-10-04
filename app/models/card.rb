require './lib/api/trello_card'

class Card < ApplicationRecord
    belongs_to :list
    
    def self.get_cards
        list = Api::TrelloCard.new
        list.create_list
    end

end
