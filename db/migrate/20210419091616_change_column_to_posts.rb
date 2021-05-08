class ChangeColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    change_column_default :posts, :rate, from: 0, to: 1
  end
end
