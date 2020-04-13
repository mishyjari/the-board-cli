class AddForeignIdsToTicket < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :client_id, :integer
    add_column :tickets, :courier_id, :integer
  end
end
