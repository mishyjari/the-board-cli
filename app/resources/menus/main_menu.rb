require_relative "../../../config/environment.rb"

def main_menu
  puts `clear`
  puts header

  puts "\nMAIN MENU\n"
  puts ""
  puts "OPTIONS:"
  puts ""
  puts "  [t] TICKET board"
  puts "  [c] COURIER board"
  puts "  [i] CLIENT board"
  puts "  [s] SEARCH options"
  puts "  [a] ABOUT"
  puts "  [x] EXIT"

  print "\n> "
  res = gets.chomp.downcase
  puts "\n"

  case res
    when "t"
      clear_screen
      ticket_board_menu
    when "c"
      clear_screen
      courier_board_menu
    when "i"
      clear_screen
      client_board_menu
    when "a"
      about
    when "s"
      puts "\nSearch not implemented, press enter to continue."
      gets.chomp
      main_menu
    when "x"
      exit
    else
      puts "\nInvalid Entry, press enter and try again!"
      main_menu
  end
end
