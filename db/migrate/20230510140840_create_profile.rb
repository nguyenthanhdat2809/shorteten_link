class CreateProfile < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number, null: false, unique: true
      t.string :card_id, null: false, unique: true
      t.timestamps
    end

    add_index :profiles, :phone_number, unique: true
    add_index :profiles, :card_id, unique: true
    add_foreign_key :profiles, :users, column: :user_id
  end
end
