require_relative "../../../config/environment.rb"

def ticket_board_menu
  puts "\n\nTICKET BOARD MENU\n"
  puts "\nOPTIONS:"
  puts "  [:id] Enter Job ID Number to Edit, Assign or Complete Ticket."
  puts "  [u] Enter 'u' to view only unassigned tickets."
  puts "  [c] Enter 'c' to switch to courier board."
  puts "  [i] Enter 'i' to switch to client board."
  puts "  [b] Enter 'b' to go back to the main menu."
  puts "  [s] Enter 's' to go to the search menu."
  puts "  [o] Enter 'r' to show incopmplete tix."
  puts "  [x] Enter 'x' to exit."

  res = gets.chomp.downcase

  case res
    when "b"
      main_menu
    when "u"
      clear_screen
      ticket_board_unassigned
    when "o"
      clear_screen
      ticket_board_incomplete
    when "c"
      clear_screen
      courier_board_menu
    when "i"
      clear_screen
      client_board_menu
    when "s"
      puts "\nSearch not implemented, press enter to continue"
      gets.chomp
      clear_screen
      ticket_board_menu
    when "x"
      exit
    else
      begin
        ticket = Ticket.find(res.to_i)
        clear_screen
        ticket_details(ticket)
        ticket_detail_menu(ticket)
      rescue
        puts "\nInvalid Entry, press enter to try again!"
        gets.chomp
        clear_screen
        ticket_board_menu
      end
    end
end
