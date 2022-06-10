class CreateCosmetics < ActiveRecord::Migration[6.1]
  def change
    create_table :cosmetics do |t|

      t.string :item
      t.text :description
      t.float :evaluation
      t.integer :user_id
      
      t.timestamps
    end
  end
end
