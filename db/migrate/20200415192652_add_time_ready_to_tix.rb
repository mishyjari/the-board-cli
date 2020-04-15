class AddTimeReadyToTix < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :time_ready, :datetime
  end
end
