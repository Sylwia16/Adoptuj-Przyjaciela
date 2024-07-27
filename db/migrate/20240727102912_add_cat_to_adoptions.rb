class AddCatToAdoptions < ActiveRecord::Migration[7.1]
  def change
    add_reference :adoptions, :cat, foreign_key: true, null: true
  end
end
