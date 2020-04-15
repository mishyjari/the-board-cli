class RemoveAndReplaceTimeOrderedInTickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :time_ordered
    add_column :tickets, :time_ordered, :datetime
  end
end
