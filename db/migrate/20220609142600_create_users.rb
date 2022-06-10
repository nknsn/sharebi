class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :introduction
      t.string :working_place
      t.integer :affiliation
      t.integer :skin_type

      t.timestamps
    end
  end
end
