class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :categories
      t.text :body
      t.timestamps
    end
   
  end
end
