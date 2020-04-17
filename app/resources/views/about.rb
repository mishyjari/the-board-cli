require_relative "../../../config/environment.rb"

def about
  clear_screen

  puts "\nABOUT 'THE BOARD'\n"


  puts "\nCONTRIBUTORS:"
  puts ""
  puts "  - Michelle Frattaroli"
  puts "  - Kat Maldon"
  puts ""
  puts ""
  puts "  'THE BOARD' is an interactive CLI application designed for courier services."
  puts "  The menu navigation guides the dispatcher through a seamless user experience,"
  puts "  offering simple prompts every step of the way. 'THE BOARD' makes it easy to"
  puts "  keep track of existing jobs, enter and update information, and change the"
  puts "  status and details of all your couriers, clients, and tickets."
  puts "  We keep your operation running smoothly."
  puts ""
  puts "*** FOR A COMPLETE USAGE GUIDE AND ADDITIONAL INFORMATION, PLEASE CONSULT THE README. ***"
  puts ""
  puts "\n Press enter to return to MAIN MENU.\n"
  puts ""
  puts ""

  gets
  main_menu
end
