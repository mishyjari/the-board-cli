require_relative "../../config/environment.rb"

def header
  puts "####### ##   ## #######  ######    ###      #    #####  #####" 
  puts "  ##    ##   ## ##       ##   ## ##   ##   # #   ##   # ##   #"
  puts "  ##    ####### ####     ## ###  ##   ##  #####  ###### ##   ##"
  puts "  ##    ##   ## ##       ##   ## ##   ## ##   ## ##  #  ##   #"
  puts "  ##    ##   ## #######  ######    ###   ##   ## ##   # #####"
  puts "######################   #{Time.now.to_date}   #########################"
end

def list_all_clients
  puts "\n"
  Client.all.each do |c|
    puts "ID: #{c.id} | #{c.name}"
  end
  puts "\n"
end

def client_detail(c)
  puts "\nCLIENT DETAILS FOR CLIENT ##{c.id.to_s}"
  puts "  Name: #{c.name}"
  puts "  Address: #{c.address}"
  puts "  Contact: #{c.contact_person} | #{c.contact_phone}\n"
end

def exit
  puts 'Goodbye!'
end

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

def ticket_board_incomplete
  puts "\n###############################################"
  puts "# INCOMPLETE JOBS:\n"
  Ticket.all.incomplete_jobs.each do |t|
    ticket_details(t)
  end
  ticket_board_menu
end

def ticket_board_unassigned
  puts "\n###############################################"
  puts "# INCOMPLETE JOBS:\n"
  Ticket.all.unassigned_jobs.each do |t|
    ticket_details(t)
  end
  ticket_board_menu
end

def list_couriers
  puts "############ ACTIVE COURIERS ################\n"
  Courier.active_couriers.each do |c|
    puts "\nID ##{c.id.to_s} - #{c.name}"
    puts "  Holding #{c.incomplete_tickets_by_courier.length.to_s} packages\n"
  end
  puts "\n"
end

def assign_ticket(t)
  ticket_details(t)
  list_couriers
  puts "\nEnter the ID of the courier you wish to assign this ticket to."
  res = gets.chomp.to_i
  courier = Courier.all.find(res)
  if courier
    clear_screen
    t.assign(courier)
    puts "Job successfully assigned to #{courier.name}\n"
    ticket_details(t)
    puts "Press enter to return to incomplete jobs board"
    gets.chomp
    clear_screen
    ticket_board_incomplete
  else
    puts "No courier with that ID found, try again"
    assign_ticket(t)
  end
end

def complete_ticket(t)
  ticket_details(t)
  puts "Enter the POD (point-of-delivery)"
  puts "  e.g., 'Jane Doe, Reception'"
  pod = gets.chomp
  while pod.length == 0 do
    puts "POD can not be empty! Try again:"
    pod = gets.chomp
  end
  clear_screen
  t.complete(pod)
  ticket_details(t)
  puts "Ticket Completed, press enter to return to incomplete job board"
  gets.chomp
  clear_screen
  ticket_board_menu
end

