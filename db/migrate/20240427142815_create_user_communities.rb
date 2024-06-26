class CreateUserCommunities < ActiveRecord::Migration[7.1]
  def change
    create_table :user_communities do |t|
      t.references :user, null: false, foreign_key: true
      t.references :community, null: false, foreign_key: true
      t.integer :status
      t.string :code
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
