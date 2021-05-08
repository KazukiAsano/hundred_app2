class AddColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :purchase_num, :boolean, default: true, null: false
  end
end
