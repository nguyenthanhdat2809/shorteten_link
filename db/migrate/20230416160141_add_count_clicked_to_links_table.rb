class AddCountClickedToLinksTable < ActiveRecord::Migration[6.1]
  def change
    add_column :links, :count_clicked, :integer, default: 0, after: :original_url
  end
end
