require_relative "../../../config/environment.rb"

def ticket_detail_menu(t)

  puts "\n\n====================  TICKET DETAIL MENU  ========================\n"
  puts "OPTIONS"
  puts "  [y] ACCEPT ticket but DON'T assign" if t.status == 'pending'
  puts "  [a] ASSIGN ticket to courier" if !t.courier_id
  puts "  [u] UNASSIGN ticket from #{t.courier.name}" if t.courier_id
  puts ""
  puts "  [o] Mark ticket COMPLETE" if t.status != 'complete'
  puts "  [e] EDIT ticket details"
  puts "  [delete] DELETE ticket"
  puts ""
  puts "  [tc] Show all INCOMPLETE tickets assigned to this COURIER" if t.courier_id
  puts "  [ti] Show all INCOMPLETE tickets from this CLIENT"
  puts ""
  puts "  [s] Switch to SEARCH MENU"
  puts "  [c] Switch to COURIERS MENU"
  puts "  [i] Switch to CLIENTS MENU"
  puts "  [t] Go Back to TICKETS MENU"
  puts "  [m] Go Back to MAIN MENU"
  puts "  [x] EXIT Application"

  print "\n> "
  res = gets.chomp.downcase
  puts "\n"

  case res
  when 'y'
    t.accept
    clear_screen
    ticket_detail(t)
    ticket_detail_menu(t)
  when 'a'
    clear_screen
    ticket_detail(t)
    ticket_assign_menu(t)
    ticket_detail(t)
    ticket_detail_menu(t)
  when 'u'
    t.unassign
    clear_screen
    ticket_detail(t)
    puts "\nTicket unassigned. Press enter"
    gets
    clear_screen
    ticket_detail(t)
    ticket_detail_menu(t)
  when 'o'
    ticket_complete_form(t)
  when 'e'
    ticket_edit_menu(t)
  when 'delete'
    ticket_delete_form(t)
  when 'tc'
    courier = t.courier if t.courier_id
    clear_screen
    puts "\nINCOMPLETE TICKETS ASSIGNED TO #{courier.name.upcase}\n"
    list_tickets(courier.incomplete_tickets_by_courier)
    puts "\nPress enter to return to ticket detail"
    gets
    clear_screen
    ticket_detail(t)
    ticket_detail_menu(t)
  when 'ti'
    client = t.client
    clear_screen
    puts "\nINCOMPLETE TICKETS BY #{client.name.upcase}\n"
    list_tickets(client.incomplete_tickets_by_client)
    puts "\nPress enter to return to ticket detail"
    gets
    clear_screen
    ticket_detail(t)
    ticket_detail_menu(t)
  when 's'
    puts "\nSearch not implemented. Press enter"
    gets
    clear_screen
    ticket_detail(t)
    ticket_detail_menu(t)
  when 'c'
    courier_board_menu
  when 'i'
    client_board_menu
  when 't'
    clear_screen
    ticket_board_menu
  when 'm'
    main_menu
  when 'x'
    exit
  else
    puts 'Invalid Input. Press enter to continue'
    gets
    clear_screen
    ticket_detail(t)
    ticket_detail_menu(t)
  end
end
