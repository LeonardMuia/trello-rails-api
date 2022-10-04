class Card < ApplicationRecord
    belongs_to :list
    # validates_uniqueness_of :cardId
end
