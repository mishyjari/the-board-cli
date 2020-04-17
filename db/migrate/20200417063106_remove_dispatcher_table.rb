class RemoveDispatcherTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :dispatchers
  end
end
