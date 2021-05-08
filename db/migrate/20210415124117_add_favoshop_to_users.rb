class AddFavoshopToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :favoshop, :string
  end
end
