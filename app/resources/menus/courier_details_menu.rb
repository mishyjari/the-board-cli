require_relative "../../../config/environment.rb"

def courier_detail_menu(c)
  puts "Menu to access #{c.name} not implemented."
  puts "Press enter to return to last menu"
  gets.chomp
  clear_screen
  courier_board_menu
end
