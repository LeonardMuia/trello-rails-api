class List < ApplicationRecord
    has_many :cards, dependent: :destroy

    validates_uniqueness_of :listId

    def get_list
        get_list = TrelloList.new()
        get_list.create_list
    end

end
