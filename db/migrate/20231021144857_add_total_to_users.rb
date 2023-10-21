class AddTotalToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :total, :float, default: 0
  end
end
