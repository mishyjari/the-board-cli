require_relative "../../../config/environment.rb"

def client_board_menu
  puts "\nCLIENT BOARD MENU\n"
  puts "\nOPTIONS:"
  puts "  [:id] Show client details by ID"
  puts "  [a] ALL Clients"
  puts "  [t] Clients with open TICKETS"
  puts "  [s] SEARCH for client by name"
  puts "  [n] Create NEW Client"
  puts "  [m] Back to MAIN MENU"
  puts "  [x] EXIT Application"

  print "\n> "
  res = gets.chomp.downcase
  puts "\n"

  case res
  when "a"
    clear_screen
    list_all_clients
    client_board_menu
  when "t"
    clear_screen
    puts "Clients with open tickets not implimented. Press enter to continue."
    gets.chomp
    client_board_menu
  when "s"
    clear_screen
    puts "Search for client by name not implimented. Press enter to continue."
    gets.chomp
    client_board_menu
  when "n"
    clear_screen
    new_client_form
    client_board_menu
  when "m"
    main_menu
  when "x"
    exit
  else
    begin
      c = Client.find(res.to_i)
      clear_screen
      client_detail_menu(c)
    rescue
      clear_screen
      puts "Invalid entry, try again!"
      client_board_menu
    end
  end
end
