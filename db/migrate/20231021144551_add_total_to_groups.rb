class AddTotalToGroups < ActiveRecord::Migration[7.1]
  def change
    add_column :groups, :total, :float, default: 0
  end
end
