require_relative "../../../config/environment.rb"

def courier_board_menu
  clear_screen
  puts "\nCOURIER BOARD\n"
  puts "\nOPTIONS"
  puts "[c] LIST Active Couriers"
  puts "[a] List ALL Couriers"
  puts "[r] List CLEAR Couriers"
  puts ""
  puts "[n] Create NEW Courier"
  puts ""
  puts "[l] Switch to CLIENT BOARD"
  puts "[t] Switch to TICKET BOARD"
  puts "[m] Return to MAIN MENU"
  puts "[x] EXIT Application"

  print "\n> "
  res = gets.chomp.downcase
  puts "\n"

  case res
  when "c"
    # Active Couriers
    puts "Feature not implemented. Press Enter to continue"
    gets.chomp
    clear_screen
    courier_board_menu
  when "a"
    # All Couriers
    puts "Feature not implemented. Press Enter to continue"
    gets.chomp
    clear_screen
    courier_board_menu
  when "r"
    # Clear Couriers
    puts "Feature not implemented. Press Enter to continue"
    gets.chomp
    clear_screen
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
    puts "Invalid entry, press enter and retry"
    gets.chomp
    clear_screen
    courier_board_menu
  end
end
