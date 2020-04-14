require_relative "../../../config/environment.rb"


# These methods should be factored out as much as possible to instead use instance methods.
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
