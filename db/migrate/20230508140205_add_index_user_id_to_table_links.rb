class AddIndexUserIdToTableLinks < ActiveRecord::Migration[6.1]
  def change
    add_index :links, :user_id
  end
end
