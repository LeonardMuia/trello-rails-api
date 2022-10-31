require './lib/api/trello_card'

class Card < ApplicationRecord
    belongs_to :list
    
    def self.get_cards
        card = Api::TrelloCard.new
        card.get_cards
    end

    def self.add_card
        card = Api::TrelloCard.new
    end

end
