require_relative "../../../config/environment.rb"

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
