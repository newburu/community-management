class CreateCommunities < ActiveRecord::Migration[7.1]
  def change
    create_table :communities do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :url
      t.text :comment

      t.timestamps
    end
  end
end
