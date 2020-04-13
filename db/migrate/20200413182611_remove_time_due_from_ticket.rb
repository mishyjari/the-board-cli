class RemoveTimeDueFromTicket < ActiveRecord::Migration[6.0]
  def change
    # We will leave this in the model to be calculated based on rush status
    remove_column :tickets, :time_due
  end
end
