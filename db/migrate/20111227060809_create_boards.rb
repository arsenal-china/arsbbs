class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name
      t.text :description
      t.integer :topic_count
      t.integer :post_count

      t.timestamps
    end
  end
end
