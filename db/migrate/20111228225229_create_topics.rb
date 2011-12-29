class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.integer :author_id
      t.text :description
      t.text :content
      t.integer :reply_count
      t.integer :view_count
      t.datetime :last_replied_at

      t.timestamps
    end
  end
end
