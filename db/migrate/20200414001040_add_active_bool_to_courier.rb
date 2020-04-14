class AddActiveBoolToCourier < ActiveRecord::Migration[6.0]
  def change
    add_column :couriers, :active, :boolean, default: true
  end
end
