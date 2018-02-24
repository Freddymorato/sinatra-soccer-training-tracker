class CreateDrillCategories < ActiveRecord::Migration[5.1]
    def change
      create_table :drill_categories do |t|
        t.integer :drill_id
        t.integer :category_id
        t.timestamps
    end
  end
end
