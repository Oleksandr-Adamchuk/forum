class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.references :user
      t.string :title
      t.timestamps
    end
    es
  end
end
