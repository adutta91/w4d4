class ChangeIndicesOnNotesTable < ActiveRecord::Migration
  def change
    remove_index :notes, :user_id
    remove_index :notes, :track_id
    add_index :notes, :user_id
    add_index :notes, :track_id
  end
end
