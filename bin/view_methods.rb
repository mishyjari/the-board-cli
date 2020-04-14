require_relative "../config/environment.rb"

def greet
  puts 'hello'
end

def main_prompt
  puts "Select an option by typing the associated key followed by enter."
  puts "[t] View board by INCOMPLETE TICKETS"
  puts "[c] View board by ACTIVE COURIERS"
  puts "[i] View board by CLIENTS with OPEN TICKETS"
  puts "[s] View SEARCH options"
  puts "[x] EXIT"
  
  res = gets.chomp.downcase

  case res
    when "t"
      ticket_board_incomplete
    when "c"
      # Courier board
    when "i"
      # Client board
    when "s"
      # Search
    when "x"
      return
    else
      puts "Invalid Entry, try again!"
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
  gets.chomp
end

def ticket_board_prompt
  puts "\nOPTIONS:"
  puts "  [:id] Enter Job ID Number to Edit, Assign or Complete Ticket."
  puts "  [u] Enter 'u' to view only unassigned tickets."
  puts "  [l] Enter 'l' to view only late tickets."
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
      # Unassigned jobs
    when "l"
      # Late Jobs
    when "r"
      ticket_board_incomplete
    when "c"
      # Courier board
    when "i"
      # Client board
    when "s"
      # Search
    when "x"
      return
    else
      begin 
        ticket = Ticket.find(res.to_i)
        ticket_details(ticket)
        edit_ticket_prompt(ticket)
      rescue
        puts "Invalid Entry, try again!"
        ticket_board_prompt 
      end
    end
end

def edit_ticket_prompt(t)
  ticket_details(t)
  puts "OPTIONS:"
  puts "  [a] ASSIGN to Courier"
  puts "  [c] COMPLETE Ticket"
  puts "  [d] DELETE Ticket"
  puts "  [e] EDIT Ticket"
  puts "  [b] BACK to Incomplete Board"
  puts "  [m] MAIN Menu"
  puts "  [x] EXIT Application"

  res = gets.chomp.downcase

  case res
  when "a"
    assign_ticket(t)
  when "c"
    complete_ticket(t)
  when "d"
    # Delete
  when "e"
    # Edit
  when "b"
    ticket_board_incomplete
  when "m"
    main_prompt
  when "x"
    return
  else 
    puts "Invalid Entry, try again"
    edit_ticket_prompt
  end
end

def list_couriers
  Courier.all.each do |c|
    puts "ID ##{c.id.to_s} - #{c.name}"
  end
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
    puts "Press enter to return to unassigned jobs board"
    gets.chomp
    ticket_board_incomplete
  else
    puts "No courier with that ID found, try again"
    assign_ticket(t)
  end
end

def complete_ticket(t)
  ticket_details(t)
  puts "Enter the POD (point-of-deliver)"
  puts "  e.g., 'Jane Doe, Reception'"
  pod = gets.chomp
  t.complete(pod)
  ticket_details(t)
  puts "Ticket Completed, press enter to return to incomplete job board"
  gets.chomp
  ticket_board_incomplete
end
