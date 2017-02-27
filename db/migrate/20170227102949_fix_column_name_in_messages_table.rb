class FixColumnNameInMessagesTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :categories_id, :category_id
  end
end
