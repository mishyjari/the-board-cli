require_relative "../../../config/environment.rb"

def main_menu
  puts `clear`
  puts header

  puts "\nMAIN MENU\n"
  puts "OPTIONS:"
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
      # Display about/help info, abridged README kinda thing
      puts "THE BOARD is an interactive courier board developed by Michelle Frattaroli"
      puts "and Katharina Maldon. The menu navigation guides the dispatcher through a seamless"
      puts "user experience, offering simple prompts every step of the way. THE BOARD makes"
      puts "it easy to keep track of jobs, enter and update information, change the status"
      puts "and details of exisiting couriers, clients, and tickets, and keep your operation"
      puts "running smoothly."
      gets.chomp
      main_menu
    when "s"
      puts "\nSearch not implemented, press enter to continue"
      gets.chomp
      main_menu
    when "x"
      exit
    else
      puts "\nInvalid Entry, press enter and try again!"
      main_menu
  end
end
