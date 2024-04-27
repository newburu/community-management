class CreateCommunities < ActiveRecord::Migration[7.1]
  def change
    create_table :communities do |t|
      t.references :owner, foreign_key: { to_table: :users }
      t.string :name
      t.string :url
      t.text :comment

      t.timestamps
    end
  end
end
