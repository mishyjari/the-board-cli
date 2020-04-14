require_relative "../../../config/environment.rb"

def courier_board_menu
  clear_screen
  puts "\n\nCourier Board Not Implimented, but here is a list of couriers:"
  list_couriers
  puts "Press enter to go back to the main menu"
  gets.chomp
  main_menu
end
