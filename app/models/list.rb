class List < ApplicationRecord
    validates_uniqueness_of :listId
end
