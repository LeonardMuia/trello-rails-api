require './lib/api/trello_card'

class Card < ApplicationRecord

    def self.get_cards
        card = Api::TrelloCard.new
        card.get_cards
    end

    def self.add_card(card_params)
        card = Api::TrelloCard.new
        card.add_card(card_params)
    end

end
