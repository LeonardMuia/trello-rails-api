class List < ApplicationRecord
    has_many :cards, dependent: :destroy
    
    # validates_uniqueness_of :listId
end
