class Card < ApplicationRecord
    validates_uniqueness_of :cardId
end
