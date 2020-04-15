class RemoveDefaultTimeFromTicket < ActiveRecord::Migration[6.0]
  def change
    change_column :tickets, :time_ordered, :datetime
  end
end
