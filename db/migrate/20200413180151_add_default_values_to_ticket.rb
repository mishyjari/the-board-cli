class AddDefaultValuesToTicket < ActiveRecord::Migration[6.0]
  def change
    change_column :tickets, :time_ordered, :datetime, default: Time.now
    change_column :tickets, :status, :string, default: "pending"
  end
end
