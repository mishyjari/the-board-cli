require_relative "../../../config/environment.rb"

def list_tickets(array)
  # Can be passed any array of instances to display
  array.each do |t|
    puts "\nID: #{t.id} | #{t.status.upcase} #{t.courier.name if t.courier_id} | #{t.client.name}"
    puts "  P/U: #{t.pickup_address} | Ordered: #{t.time_ordered}"
    puts "  TO: #{t.dropoff_address} | Due: #{t.time_due}"
  end
end
