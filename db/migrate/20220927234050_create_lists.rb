class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.string :listId
      t.string :name
      t.string :board
      t.timestamps
    end
  end
end
