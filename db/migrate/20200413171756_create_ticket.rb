class CreateTicket < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :pickup_address
      t.string :dropoff_address
      t.datetime :time_ordered
      t.datetime :time_due
      t.datetime :time_delivered
      t.string :status
      t.string :pod
      t.boolean :rush
      t.boolean :oversize
    end
  end
end
