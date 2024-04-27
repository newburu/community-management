class AddColumnToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role, :integer
    add_column :users, :comment, :text
  end
end
