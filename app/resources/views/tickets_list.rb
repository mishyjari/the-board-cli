require_relative "../../../config/environment.rb"

# Incomplete, unassigned, pending, today

def tickets_list(type)


  # Handle different args passed into tickets_list, calling class methoda in the ticket model and store results in an array to be displayed
  type = type.downcase
  case type
  when "incomplete"
    tickets = Ticket.incomplete_jobs
  when "unassigned"
    tickets = Ticket.unassigned_jobs
  when "pending"
    tickets = Ticket.pending_jobs
  when "today"
    tickets = Ticket.all_jobs_today
  else
    puts "Invalid argument for tickets list."
    puts "Can accept 'incomplete','unassigned','pending',or 'today'" 
    puts "Refer to app/resources/views/tickets_list.rb"
    puts "     and app/models/ticket.rb"
    puts "Press enter to return the tickets menu"
    gets
    clear_screen
    tickets_board_menu
  end

  # Display results. Should be kept compact but display crucial info.
  tickets.each do |t|
    puts "\nID: #{t.id} | #{t.status.upcase} #{t.courier.name if t.courier_id} | #{t.client.name}"
    puts "  P/U: #{t.pickup_address} | Ordered: #{t.time_ordered}"
    puts "  TO: #{t.dropoff_address} | Due: #{t.time_due}"
  end

end
