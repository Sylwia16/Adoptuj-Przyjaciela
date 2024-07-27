class ChangeDogIdInAdoptionsToAllowNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :adoptions, :dog_id, true
  end
end
