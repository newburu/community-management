class CreateStrengths < ActiveRecord::Migration[7.1]
  def change
    create_table :strengths do |t|
      t.string :name
      t.integer :kind
      t.text :comment

      t.timestamps
    end
  end
end
