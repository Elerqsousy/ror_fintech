class AddIconToGroups < ActiveRecord::Migration[7.1]
  def change
    add_column :groups, :icon, :text, null: false
  end
end
