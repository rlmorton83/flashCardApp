class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.text :front
      t.text :back
      t.integer :deck_id
      t.belongs_to :card, foreign_key: true

      t.timestamps
    end
  end
end
