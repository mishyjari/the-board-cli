require_relative "../../../config/environment.rb"

def client_detail_menu(c)
  client_detail(c)
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
    clear_screen
    puts client_detail(c)
    puts "\nEdit Name"
    puts c.name
    puts "Enter new NAME or press ENTER to cancel."
    print "> "
    name = gets.chomp
    if name.length == 0
      puts "Name unchanged, press enter to continue"
      gets.chomp
      client_detail(c)
      client_detail_menu(c)
    else
      c.name = name
      c.save
      clear_screen
      client_detail(c)
      puts "\nName updated to #{c.name}"
      puts "Press enter to continue."
      gets.chomp
      clear_screen
      client_detail_menu(c)
    end
  when "a" # Edit ADDRESS
    clear_screen
    puts client_detail(c)
    puts "\nEdit Address"
    puts c.address
    puts "Enter new ADDRESS or press ENTER to cancel."
    print "> "
    addr = gets.chomp
    if addr.length == 0
      puts "Address unchanged, press enter to continue"
      gets.chomp
      client_detail(c)
      client_detail_menu(c)
    else
      c.address = addr
      c.save
      clear_screen
      client_detail(c)
      puts "\nAddress updated to #{c.address}"
      puts "Press enter to continue."
      gets.chomp
      clear_screen
      client_detail_menu(c)
    end
  when "c" # Edit CONTACT PERSON
    clear_screen
    puts client_detail(c)
    puts "\nEdit Contact Person"
    puts c.contact_person
    puts "Enter new CONTACT PERSON or press ENTER to cancel."
    print "> "
    person = gets.chomp
    if person.length == 0
      puts "Contact Person unchanged, press enter to continue"
      gets.chomp
      client_detail(c)
      client_detail_menu(c)
    else
      c.contact_person = person
      c.save
      clear_screen
      client_detail(c)
      puts "\nContact Person updated to #{c.contact_person}"
      puts "Press enter to continue."
      gets.chomp
      clear_screen
      client_detail_menu(c)
    end
  when "p" # EDIT CONTACT PHONE
    clear_screen
    puts client_detail(c)
    puts "\nEdit Contact_Pbone"
    puts c.contact_phone
    puts "Enter new CONTACT PHONE or press ENTER to cancel."
    print "> "
    phone = gets.chomp
    if phone.length == 0
      puts "Contact Phone unchanged, press enter to continue"
      gets.chomp
      client_detail(c)
      client_detail_menu(c)
    else
      c.contact_phone = phone
      c.save
      clear_screen
      client_detail(c)
      puts "\nContact Phone updated to #{c.contact_phone}"
      puts "Press enter to continue."
      gets.chomp
      clear_screen
      client_detail_menu(c)
    end
  when "t"
    # View Incomplete Tix for this client
    clear_screen
    puts client_detail(c)
    puts "Incomplete tickets by client not implimented. Press enter to continue"
    gets.chomp
    clear_screen
    client_detail_menu(c)
  when "s"
    clear_screen
    puts client_detail(c)
    puts "Client ticket search not implimented. Press enter to continue"
    gets.chomp
    clear_screen
    client_detail_menu(c)
  when "delete"
    clear_screen
    puts client_detail_menu(c)
    puts "Delete client not implimented. Press enter to continue"
    gets.chomp
    clear_screen
    client_detail_menu(c)
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
    clear_screen
    client_detail_menu(c)
  end

end
