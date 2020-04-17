require_relative "../../../config/environment.rb"

def ticket_delete_form(t)
  clear_screen
  ticket_detail(t)
  puts "\n========================= !!DELETE TICKET!! ===========================\n"

  puts "\nARE YOU _SURE_ YOU WANT TO DELETE THIS TICKET?\n"
  puts "\nTHIS CAN NOT BE UNDONE!!!\n"

  puts "Type the ticket ID (#{t.id.to_s}) and press enter."
  print "\n> "
  res = gets.chomp.to_i
  puts "\n"

  # Validation
  if res == t.id
    t.delete
    puts "Ticket deleted. Hope you meant it, cause it's gone."
    puts "Press enter to return to tickets menu."
    gets
    clear_screen
    ticket_board_menu
  else
    puts "Delete validation failed."
    puts "Press enter to return to ticket detail."
    gets
    clear_screen
    ticket_detail(t)
    ticket_detail_menu(t)
  end
end

