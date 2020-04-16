require_relative "../../../config/environment.rb"

def client_board_menu
  puts ""
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
    puts "\nALL CLIENTS\n\n"
    list_clients(Client.all)
    client_board_menu
  when "t"
    clear_screen
    puts "\nCLIENTS WITH INCOMPLETE TICKETS\n\n"
    list_clients(Client.all.clients_with_incomplete_tickets)
    client_board_menu
  when "s"
    puts "\n\nSearch for client by name not implimented. Press enter to continue."
    gets.chomp
    clear_screen
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
      client_detail(c)
      client_detail_menu(c)
    rescue
      clear_screen
      puts "Invalid entry, try again!"
      client_board_menu
    end
  end
end
