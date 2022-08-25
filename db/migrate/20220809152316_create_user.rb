class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, index: true; null: false, unique: true
      t.string :photo
      t.text :bio
      t.integer :posts_counter

      t.timestamps
    end
  end
end
