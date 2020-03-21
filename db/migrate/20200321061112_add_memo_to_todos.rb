class AddMemoToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :memo, :text
  end
end
