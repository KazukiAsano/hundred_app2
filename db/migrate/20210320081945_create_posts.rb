class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.text :comment
      t.string :shop_name
      t.float :rate, default: 0
      t.integer :genre, null: false, default: 0
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
