require_relative "../../../config/environment.rb"

def courier_board_menu
  puts "\nCOURIER BOARD\n"
  puts "\nOPTIONS"
  puts "[:id] View Courier by ID"
  puts "[c] List Active COURIERS"
  puts "[a] List ALL Couriers"
  puts "[r] List CLEAR Couriers"
  puts "[d] Courier DETAILS"
  puts ""
  puts "[n] Create NEW Courier"
  puts ""
  puts "[i] Switch to CLIENT BOARD"
  puts "[t] Switch to TICKET BOARD"
  puts "[m] Return to MAIN MENU"
  puts "[x] EXIT Application"


  print "\n> "
  res = gets.chomp.downcase
  puts "\n"

  case res
  when "c"
    # Active Couriers
    clear_screen
    list_couriers('active')
    courier_board_menu
  when "d"
    clear_screen
    courier_details_menu
  when "a"
    # All Couriers
    clear_screen
    list_couriers('all')
    courier_board_menu
  when "r"
    # Clear Couriers
    clear_screen
    list_couriers('clear')
    courier_board_menu
  when "n"
    # New Courier
    puts "Feature not implemented. Press Enter to continue"
    gets.chomp
    clear_screen
    courier_board_menu
  when "l"
    clear_screen
    client_board_menu
  when "t"
    clear_screen
    ticket_board_menu
  when "m"
    main_menu
  when "x"
    exit
  else
    begin
      c = Courier.find(res.to_i)
      clear_screen
      courier_details(c)
      courier_details_menu(c)
    rescue
      clear_screen
      puts "Invalid entry, try again!"
      courier_board_menu
    end
  end
end
