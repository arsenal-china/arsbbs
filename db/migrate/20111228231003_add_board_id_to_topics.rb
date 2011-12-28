class AddBoardIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :board_id, :integer
  end
end
