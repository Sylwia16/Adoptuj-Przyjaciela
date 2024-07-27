class AddForeignKeyToAdoptions < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :adoptions, :dogs
    remove_foreign_key :adoptions, :cats
    add_foreign_key :adoptions, :dogs, on_delete: :cascade
    add_foreign_key :adoptions, :cats, on_delete: :cascade
  end
end
