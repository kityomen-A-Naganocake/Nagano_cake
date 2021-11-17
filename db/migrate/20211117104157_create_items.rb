class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id, :null => false
      t.boolean :is_active, :null => false, :default => true
      t.string :name, :null => false
      t.integer :price_no_tax, :null => false
      t.text :description, :null => false
      t.string :image_id, :null => false
      
      t.timestamps
    end
  end
end
