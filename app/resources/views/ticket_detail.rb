require_relative "../../../config/environment.rb"

def ticket_detail(t)

  puts "\n\n===============  DETAIL VIEW FOR TICKET WITH ID ##{t.id} ++================\n\n"
  puts "                           !!! LATE !!!" if t.time_due > Time.now
  puts "  Status: #{t.status.upcase} #{t.courier.name if t.courier}"
  puts "  Client: #{t.client.name}"
  puts "  Time Ordered: #{t.time_ordered.to_s}"
  puts "  Time Ready: Not Implimented"
  puts "  Time Due: #{t.time_due.to_s}"
  puts "  Pickup Address: #{t.pickup_address}"
  puts "  Pickup Contact: #{t.pickup_contact if not nil}"
  puts "  Dropoff Address: #{t.dropoff_address}"
  puts "  Dropoff Contact: #{t.dropoff_contact if not nil}"
  puts "  Rush? #{t.rush.to_s}"
  puts "  Oversize? #{t.oversize.to_s}"
  puts "  Delivered At: #{t.time_delivered}" if t.time_delivered
  puts "  Received By: #{t.pod}" if t.pod
  puts "  Notes: #{t.notes if not nil}"

end
