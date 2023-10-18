class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.text :icon_data, null: false
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
