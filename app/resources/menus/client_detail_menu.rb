require_relative "../../../config/environment.rb"

def client_detail_menu(c)

  def refresh(c)
    clear_screen
    puts "\n"
    client_detail(c)
    puts "\n"
  end

  def refresh_all(c)
    refresh(c)
    puts "\n"
    client_detail_menu(c)
    puts "\n"
  end

  puts "\nOPTIONS:"
  puts "  [n] Edit NAME"
  puts "  [a] Edit ADDRESS"
  puts "  [c] Edit CONTACT Person"
  puts "  [p] Edit Contact PHONE"
  puts "  [t] View active client TICKETS"
  puts "  [s] SEARCH for client tickets by date"
  puts "  [delete] DELETE client"
  puts "  [b] BACK to Client Board"
  puts "  [m] Back to MAIN menu"
  puts "  [x] EXIT Application"

  print "\n> "
  res = gets.chomp.downcase
  puts "\n"

  case res
  when "n" # Edit NAME
    refresh(c)
    edit_value({key:'name',str:'name',hash:c})
    refresh_all(c)
  when "a" # Edit ADDRESS
    refresh(c)
    edit_value({key:'address',str:'address',hash:c})
    refresh_all(c)
  when "c" # Edit CONTACT PERSON
    refresh(c)
    edit_value({key:'contact_person',str:'contact person',hash:c})
    refresh_all(c)
  when "p" # EDIT CONTACT PHONE
    refresh(c)
    edit_value({key:'contact_phone',str:'contact phone',hash:c})
    refresh_all(c)
  when "t"
    # View Incomplete Tix for this client
    refresh(c)
    puts "Incomplete tickets by client not implimented. Press enter to continue"
    gets.chomp
    refresh_all(c)
  when "s"
    refresh(c)
    puts "Client ticket search not implimented. Press enter to continue"
    gets.chomp
    refresh_all(c)
  when "delete"
    refresh(c)
    puts "Delete client not implimented. Press enter to continue"
    gets.chomp
    refresh_all(c)
  when "b"
    clear_screen
    client_board_menu
  when "m"
    main_menu
  when "x"
    exit
  else
    puts "Invalid entry, press enter to try again."
    gets.chomp
    refresh_all(c)
  end

end
