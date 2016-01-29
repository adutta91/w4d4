class AddTitleToNotesTable < ActiveRecord::Migration
  def change
    add_column :notes, :title, :string, null: false, default: ""
  end
end
