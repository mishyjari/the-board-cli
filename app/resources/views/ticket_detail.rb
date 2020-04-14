require_relative "../../../config/environment.rb"

def ticket_details(t)
    puts "\n############### JOB ID ##{t.id.to_s} ##################"
    puts "#  !!! LATE !!!" if t.time_due > Time.now
    puts "#  STATUS: #{t.status.upcase}"
    puts "#  Client: #{t.client.name}"
    puts "#  Pickup: #{t.pickup_address}"
    puts "#  Dropoff: #{t.dropoff_address}"
    puts "#  Time Ordered: #{t.time_ordered.month}/#{t.time_ordered.day} at #{t.time_ordered.hour}:#{t.time_ordered.min}"
    puts "#  Time Due: #{t.time_due.month}/#{t.time_due.day} at #{t.time_due.hour}:#{t.time_due.min}"
    puts "#  Assigned Courier: #{t.courier.name}" if t.courier
    puts "#  Delivered at:  #{t.time_delivered.month}/#{t.time_delivered.day} at #{t.time_delivered.hour}:#{t.time_delivered.min}" if t.time_delivered
    puts "#  Signed By: #{t.pod}" if t.pod
    puts "###############################################\n"
end
