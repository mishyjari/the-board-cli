class AddContactToCouriers < ActiveRecord::Migration[6.0]
  def change
    add_column :couriers, :phone, :string
    add_column :couriers, :email, :string
  end
end
