require './lib/api/trello_list'

class List < ApplicationRecord
    has_many :cards, dependent: :destroy

    validates_uniqueness_of :listId

    def self.get_list
        list = Api::TrelloList.new
        list.create_list
    end

end
