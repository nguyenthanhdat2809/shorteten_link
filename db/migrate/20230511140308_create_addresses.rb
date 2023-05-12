class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :country, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.timestamps
    end

    add_foreign_key :addresses, :users, column: :user_id
  end
end
