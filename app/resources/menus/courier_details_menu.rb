require_relative "../../../config/environment.rb"

# not sure how to pass in the instance of an individual courier, looked in clients_details but didn't fully get how we did it there

def courier_details_menu(c)
  courier_details(c)
  #puts "Menu to access #{c.name} not implemented."
  puts "\n\n====================  COURIER DETAILS MENU  ========================\n"
  puts ""
  puts "OPTIONS"
  puts ""
  puts "  [sa] Change courier STATUS to active" if c.status == 'inactive'
  puts "  [si] Change courier STATUS to inactive" if c.status == 'active'
	puts "  [a] ASSIGN ticket to this courier (list unassigned tix not implemented)"
  puts "  [e] EDIT courier details"
  puts ""
	puts "  [d] View tickets by DATE range (search)"
  puts "  [delete] DELETE courier"
  puts ""
	puts "  [c] Go back to COURIER BOARD"
	puts "  [m] Go back to MAIN MENU"
  puts "  [x] EXIT application"
  puts ""
  puts "Press enter to return to last menu"

  print "\n"
  res = gets.chomp.downcase
  puts "\n"

  case res
  when 'sa'
    puts "change status to active not implemented, press enter to continue"
    gets
    clear_screen
    puts courier_details_menu
  when 'si'
    puts "change status to inactive not implemented, press enter to continue"
    gets
    clear_screen
    puts courier_details_menu
  when 'a'
    puts "assign ticket method not implemented, press enter to continue"
    gets
  when 'e'
    clear_screen
    courier_edit_menu # not implemented, empty method
  when 'd'
    puts "search by date range not implemented, press enter to continue"
    gets
    clear_screen
    puts courier_details_menu
  when 'delete'
    clear_screen
    puts "list courier details not implemented"
    puts ""
    puts "PLEASE TYPE COURIER NAME TO CONTINUE DELETE COURIER"
    puts "WARNING: THIS ACTION IS NOT REVERSIBLE"
    r = gets.chomp.downcase
    if r == c.name.downcase
      c.delete
    else
      puts "Deletion unsuccesful. Press enter to continue."
      gets
    clear_screen
    courier_details_menu(c)
    end
  when 'c'
    clear_screen
    courier_board_menu
  when 'm'
    clear_screen
    main_menu
  when 'x'
    exit
  end

end
