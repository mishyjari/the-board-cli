require_relative "../config/environment.rb"

def exit
  puts 'Goodbye!'
end

def main_prompt
  puts "OPTIONS:"
  puts "  [t] View board by INCOMPLETE TICKETS"
  puts "  [c] View board by ACTIVE COURIERS"
  puts "  [i] View board by CLIENTS with OPEN TICKETS"
  puts "  [s] View SEARCH options"
  puts "  [x] EXIT"

  res = gets.chomp.downcase

  case res
    when "t"
      ticket_board_incomplete
    when "c"
      courier_board
    when "i"
      puts "\nClient board not implemented, press enter to continue"
      gets.chomp
      main_prompt
    when "s"
      puts "\nSearch not implemented, press enter to continue"
      gets.chomp
      main_prompt
    when "x"
      exit
    else
      puts "\nInvalid Entry, press enter and try again!"
      main_prompt
  end
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
  ticket_board_prompt
end

def ticket_board_unassigned
  puts "\n###############################################"
  puts "# INCOMPLETE JOBS:\n"
  Ticket.all.unassigned_jobs.each do |t|
    ticket_details(t)
  end
  ticket_board_prompt
end

def ticket_board_prompt
  puts "\nOPTIONS:"
  puts "  [:id] Enter Job ID Number to Edit, Assign or Complete Ticket."
  puts "  [u] Enter 'u' to view only unassigned tickets."
  puts "  [c] Enter 'c' to switch to courier board."
  puts "  [i] Enter 'i' to switch to client board."
  puts "  [b] Enter 'b' to go back to the main menu."
  puts "  [s] Enter 's' to go to the search menu."
  puts "  [r] Enter 'r' to refresh the board."
  puts "  [x] Enter 'x' to exit."

  res = gets.chomp.downcase

  case res
    when "b"
      main_prompt
    when "u"
      ticket_board_unassigned
    when "r"
      ticket_board_incomplete
    when "c"
      courier_board
    when "i"
      puts "\nClient board not implemented, press enter to continue"
      gets.chomp
      main_prompt
    when "s"
      puts "\nSearch not implemented, press enter to continue"
      gets.chomp
      main_prompt
    when "x"
      exit
    else
      begin
        ticket = Ticket.find(res.to_i)
        ticket_details(ticket)
        edit_ticket_prompt(ticket)
      rescue
        puts "\nInvalid Entry, try again!"
        ticket_board_prompt
      end
    end
end

def edit_ticket_prompt(t)
  ticket_details(t)
  puts "OPTIONS:"
  if !t.courier
    puts "  [a] ASSIGN to Courier"
  else
    puts "  [u] UNASSIGN from #{t.courier.name}"
  end
  puts "  [c] COMPLETE Ticket"
  puts "  [d] DELETE Ticket"
  puts "  [e] EDIT Ticket"
  puts "  [b] BACK to Incomplete Board"
  puts "  [m] MAIN Menu"
  puts "  [x] EXIT Application"

  res = gets.chomp.downcase

  case res
  when "u"
    t.unassign
    ticket_details(t)
    puts "\nTicket unassigned. Press enter to return to job board"
    gets.chomp
    ticket_board_incomplete
  when "a"
    assign_ticket(t)
  when "c"
    complete_ticket(t)
  when "d"
    puts "\nDelete not implemente, press enter to continue"
    gets.chomp
    edit_ticket_prompt(t)
  when "e"
    puts "\nEdit ticket not implemente, press enter to continue"
    gets.chomp
    edit_ticket_prompt(t)
  when "b"
    ticket_board_incomplete
  when "m"
    main_prompt
  when "x"
    exit
  else
    puts "Invalid Entry, try again"
    edit_ticket_prompt
  end
end

def courier_board
  list_couriers
  puts "OPTIONS:"
  puts "  [:id] View Details for this Courier"
  puts "  [b] BACK to main menu"
  puts "  [x] EXIT Application"

  res=gets.chomp.downcase

  case res
  when 'b'
    main_prompt
  when 'x'
    exit
  else
    begin
      c = Courier.all.find(res.to_i)
      puts "Courier " + c.name + " found, but courier details not implemented, press enter to continue."
      gets.chomp
      courier_board
    rescue
      puts "Invalid Entry, try again!"
      ticket_board_prompt
    end
  end
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
    t.assign(courier)
    puts "Job successfully assigned to #{courier.name}\n"
    ticket_details(t)
    puts "Press enter to return to incomplete jobs board"
    gets.chomp
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
  t.complete(pod)
  ticket_details(t)
  puts "Ticket Completed, press enter to return to incomplete job board"
  gets.chomp
  ticket_board_incomplete
end

