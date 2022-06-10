class CreateCosemeComments < ActiveRecord::Migration[6.1]
  def change
    create_table :coseme_comments do |t|

      t.text :comment
      t.integer :user_id
      t.integer :cosmetic_id
      
      t.timestamps
    end
  end
end
