require_relative "../../../config/environment.rb"

def courier_detail_menu#(c)
  #puts "Menu to access #{c.name} not implemented."
  puts "\n\n====================  COURIER DETAILS MENU  ========================\n"
  puts "OPTIONS"
  puts ""
  puts "  [sa] Change courier STATUS to active" #if c.status == 'inactive'
  puts "  [si] Change courier STATUS to inactive" #if c.status == 'active'
	puts "  [a] ASSIGN ticket to this courier (list unassigned tix not implemented)"
  puts "  [e] EDIT courier details"
  puts ""
	puts "  [tc] View COMPLETED TICKETS today"
	puts "  [d] View tickets by DATE range (search)"
  puts "  [delete] DELETE courier"
  puts ""
	puts "  [c] Go back to COURIER BOARD"
	puts "  [b] or [m] Back to MAIN MENU"
  puts "  [x] EXIT application"
  puts ""
  puts "Press enter to return to last menu"

  res = gets.chomp.downcase
  puts "\n"

  case res
  when 'sa'
    puts "change status to active not implemented, press enter to continue"
    gets
  when 'si'
    puts "change status to inactive not implemented, press enter to continue"
    gets
  when 'a'
    puts "assign ticket method not implemented, press enter to continue"
    gets
  when 'e'
    clear_screen
    courier_edit_menu # not implemented, empty method
  when 'tc'
    puts "############# COMPLETED TICKETS ################"
    puts "list completed tickets, not implemented"
  when 'd'
    puts "search by date range not implemented, press enter to continue"
    gets
  when 'delete'
    clear_screen
    puts courier_detail_menu #(c)
    puts "PLEASE TYPE COURIER NAME TO CONTINUE DELETE COURIER"
    puts "WARNING: THIS ACTION IS NOT REVERSIBLE"
    r = gets.chomp.downcase
    if r == c.name.downcase
      c.delete
    else
      puts "Deletion unsuccesful. Press enter to continue."
      gets
    clear_screen
    courier_detail_menu #(c)
    end
  when 'c'
    clear_screen
    courier_board_menu
  when 'b' || 'm'
    clear_screen
    main_menu
  when 'x'
    exit
  end

end
