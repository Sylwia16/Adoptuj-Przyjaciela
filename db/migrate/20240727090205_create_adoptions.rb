class CreateAdoptions < ActiveRecord::Migration[7.1]
  def change
    create_table :adoptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :dog, foreign_key: true
      t.references :cat, foreign_key: true

      t.timestamps
    end

    add_index :adoptions, [:dog_id, :user_id], unique: true
    add_index :adoptions, [:cat_id, :user_id], unique: true
  end
end
