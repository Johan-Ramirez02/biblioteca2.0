class ChangeStateToBeIntegerInBooks < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :state, 'integer USING CAST(state AS integer)' 
  end
end
