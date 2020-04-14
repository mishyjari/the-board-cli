class AddDetailsToTicket < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :pickup_contact, :string
    add_column :tickets, :dropoff_contact, :string
    add_column :tickets, :notes, :string
  end
end
