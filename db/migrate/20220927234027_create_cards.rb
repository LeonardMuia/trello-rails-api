class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :cardId
      t.string :name
      t.string :list
      t.timestamps
    end
  end
end
