require './lib/api/trello_list'

class List < ApplicationRecord

    def self.get_lists
        list = Api::TrelloList.new
        list.create_list
    end

end
