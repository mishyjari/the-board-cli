require_relative "../../config/environment.rb"

def clear_screen
  puts `clear`
  header
end

def main_menu
  puts `clear`
  puts header
  puts "\nMAIN MENU\n"
  puts "OPTIONS:"
  puts "  [t] TICKET Board"
  puts "  [c] COURIER Board"
  puts "  [i] CLIENT Board"
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
      puts "Not implimented: About Info. Press enter to continue"
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

def client_board_menu                                                                                                                                        
  puts "\nCLIENT BOARD MENU\n"
  puts "\nOPTIONS:"
  puts "  [:id] Show client details by ID"
  puts "  [a] ALL Clients"
  puts "  [t] Clients with open TICKETS"
  puts "  [s] SEARCH for client by name"
  puts "  [n] Create NEW Client"
  puts "  [b] BACK to main menu"
  puts "  [x] EXIT Application"

  print "\n> "
  res = gets.chomp.downcase
  puts "\n"

  case res
  when "a"
    clear_screen
    list_all_clients
    client_board_menu
  when "t"
    clear_screen
    puts "Clients with open tickets not implimented. Press enter to continue."
    gets.chomp
    client_board_menu
  when "s"
    clear_screen
    puts "Search for client by name not implimented. Press enter to continue."
    gets.chomp
    client_board_menu
  when "n" 
    clear_screen
    new_client_form
    client_board_menu
  when "b"
    main_menu
  when "x"
    exit
  else
    begin
      c = Client.find(res.to_i)
      clear_screen
      client_detail_menu(c)
    rescue
      clear_screen
      puts "Invalid entry, try again!"
      client_board_menu
    end 
  end
end

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

def ticket_board_menu
  puts "\n\nTICKET BOARD MENU\n"
  puts "\nOPTIONS:"
  puts "  [:id] Enter Job ID Number to Edit, Assign or Complete Ticket."
  puts "  [u] Enter 'u' to view only unassigned tickets."
  puts "  [c] Enter 'c' to switch to courier board."
  puts "  [i] Enter 'i' to switch to client board."
  puts "  [b] Enter 'b' to go back to the main menu."
  puts "  [s] Enter 's' to go to the search menu."
  puts "  [o] Enter 'r' to show incopmplete tix."
  puts "  [x] Enter 'x' to exit."

  res = gets.chomp.downcase

  case res
    when "b"
      main_menu
    when "u"
      clear_screen
      ticket_board_unassigned
    when "o"
      clear_screen
      ticket_board_incomplete
    when "c"
      clear_screen
      courier_board_menu
    when "i"
      clear_screen
      client_board_menu
    when "s"
      puts "\nSearch not implemented, press enter to continue"
      gets.chomp
      clear_screen
      ticket_board_menu
    when "x"
      exit
    else
      begin
        ticket = Ticket.find(res.to_i)
        clear_screen
        ticket_details(ticket)
        ticket_detail_menu(ticket)
      rescue
        puts "\nInvalid Entry, press enter to try again!"
        gets.chomp
        clear_screen
        ticket_board_menu
      end                                                                                                                                                      
    end
end

def ticket_detail_menu(t)
  clear_screen 
  ticket_details(t)
  puts "OPTIONS:"
  if !t.courier
    puts "  [a] ASSIGN to Courier"
  else
    puts "  [u] UNASSIGN from #{t.courier.name}"
  end
  puts "  [c] COMPLETE Ticket"
  puts "  [d] DELETE Ticket"
  puts "  [e] EDIT Ticket"
  puts "  [b] BACK to Incomplete Board"
  puts "  [m] MAIN Menu"
  puts "  [x] EXIT Application"

  res = gets.chomp.downcase

  case res
  when "u"
    t.unassign
    ticket_details(t)
    puts "\nTicket unassigned. Press enter to return to job board"
    gets.chomp
    clear_screen
    ticket_board_incomplete
  when "a"
    clear_screen  
    assign_ticket(t)
  when "c"
    clear_screen
    complete_ticket(t)
  when "d"
    clear_screen
    puts "\nDelete not implemente, press enter to continue"
    gets.chomp
    clear_screen
    ticket_detail_menu(t)
  when "e"
    clear_screen
    puts "\nEdit ticket not implemente, press enter to continue"
    gets.chomp
    clear_screen
    ticket_detail_menu(t)
  when "b"
    clear_screen
    ticket_board_menu
  when "m"
    main_menu
  when "x"
    exit
  else
    clear_screen
    puts "Invalid Entry, press enter to try again"
    gets.chomp
    clear_screen
    ticket_detail_menu
  end
end

def courier_board_menu
  clear_screen
  puts "\n\nCourier Board Not Implimented, but here is a list of couriers:"
  list_couriers
  puts "Press enter to go back to the main menu"
  gets.chomp
  main_menu
end
