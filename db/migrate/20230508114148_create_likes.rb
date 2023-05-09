class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.string :used_by, null: false
      t.string :used_by_id, null: false
      t.integer :counter, default: 0
      t.timestamps
    end
  end
end
