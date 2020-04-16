
require_relative "../../../config/environment.rb"

def ticket_detail_menu(t)

  puts "\n\n====================  TICKET DETAIL MENU  ========================\n"
  puts "OPTIONS"
  puts "  [y] Accept ticket but don't assign" if t.status == 'pending'
  puts "  [a] Assign ticket to courier" if !t.courier_id
  puts "  [u] Unassicourier
gn ticket form #{t.courier.name}" if t.courier_id
  puts ""
  puts "  [o] Mark ticket complete" if t.status != 'complete'
  puts "  [e] Edit ticket details"
  puts "  [delete] Delete ticket"
  puts ""
  puts "  [tc] Show all incomplete tickets assigned to this courier" if t.courier_id
  puts "  [ti] Show all incomplete tickets from this client"
  puts ""
  puts "  [s] Switch to Search Menu"
  puts "  [c] Switch to Couriers Menu"
  puts "  [i] Switch to Clients Menu"
  puts "  [t] Go Back to Tickets Menu"
  puts "  [m] Go Back to Main Menu"
  puts "  [x] Exit Application"

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
    ticket_board_menu
  when 'u'
    t.unassign
    clear_screen
    ticket_detail(t)
    puts "\nTicket unassigned. Press enter"
    gets
    ticket_detail(t)
    ticket_detail_menu(t)
  when 'o'
    ticket_complete_form(t)
  when 'e'
    ticket_edit_menu(t)
  when 'delete'
    ticket_delete_form(t)
  when 'tc'
    #Inc Tix by this courier
  when 'ti'
    #Inc Tix by this client
  when 's'
    # Search Menu
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
