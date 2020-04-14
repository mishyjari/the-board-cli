require_relative "../../../config/environment.rb"

def ticket_detail_menu(t)
  clear_screen
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
    clear_screen
    ticket_board_incomplete
  when "a"
    clear_screen
    assign_ticket(t)
  when "c"
    clear_screen
    complete_ticket(t)
  when "d"
    clear_screen
    puts "\nDelete not implemente, press enter to continue"
    gets.chomp
    clear_screen
    ticket_detail_menu(t)
  when "e"
    clear_screen
    puts "\nEdit ticket not implemente, press enter to continue"
    gets.chomp
    clear_screen
    ticket_detail_menu(t)
  when "b"
    clear_screen
    ticket_board_menu
  when "m"
    main_menu
  when "x"
    exit
  else
    clear_screen
    puts "Invalid Entry, press enter to try again"
    gets.chomp
    clear_screen
    ticket_detail_menu
  end
end
