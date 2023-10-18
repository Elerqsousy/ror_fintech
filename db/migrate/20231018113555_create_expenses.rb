class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.references :group, null: false, foreign_key: true
      t.text :name, null: false
      t.float :amount, null: false
      t.references :author, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
