require_relative '../../../config/environment.rb'

# Pretty much just waiting on the time helper method to work before building this out.

def new_ticket_form(c=nil)

  puts "\n\nNEW TICKET FORM\n"
  def pick_client
    puts "  [enter] View client list"
    puts "  [:id] Enter the ID of the Client to use"
    puts "  [i] Switch to CLIENTS MENU for more options"
    puts "  [g] Create ticket as a guest job"
    puts "  [s] SEARCH for client by name"
    puts "  [t] Go back to the TICKETS MENU"

    print "\n> "
    client_res = gets.chomp.downcase
    puts "\n"

    case client_res
    when 'i'
      clear_screen
      client_board_menu
    when 'g'
      puts 'Guest client feature not implemented.'
      puts 'Press enter to continue'
      clear_screen
      new_ticket_form
    when 't'
      clear_screen
      ticket_board_menu
    when 's'
      puts "Client search not implemented."
      puts "Press enter to continue"
      clear_screen
      new_ticket_form
    when ''
      clear_screen
      list_clients(Client.all)
      new_ticket_form
    else
      begin
        client = Client.find(client_res.to_i)
        puts "Creating ticket with #{client.name} as client..."
        puts "Press enter"
      rescue
        puts "Invalid entry. Press enter."
        gets
        new_ticket_form
      end
    end
    client if not nil
  end

  if !c
    puts "\nTickets must have a client!"
    new_ticket_form(pick_client)
  end

  def update (hash:,key:,str:)
    key = key.to_sym
    refresh(hash)
    puts "Enter the #{str} and press enter:"
    print "> "
    res = gets.chomp
    hash[key] = res
    refresh(hash)
    prompt(hash[:client])
  end

  ticket_props = {
    client: c,
    pu_addr: nil,
    pu_cont: nil,
    drop_addr: nil,
    drop_cont: nil,
    time_ready: Time.now,
    time_due: nil,
    rush: false,
    os: false,
    notes: nil
  }
  def refresh(props)
    clear_screen
    display_ticket(props)
  end


  def display_ticket(ticket_props)
    puts "====================  NEW TICKET  ==================="
    puts "[0] CLIENT: #{ticket_props[:client].name}"
    puts "[1] PICKUP ADDRESS (required): #{ticket_props[:pu_addr] if not nil}"
    puts "[2] PICKUP CONTACT (required): #{ticket_props[:pu_cont] if not nil}"
    puts "[3] DROPOFF ADDRESS (required): #{ticket_props[:drop_addr] if not nil}"
    puts "[4] DROPOFF CONTACT (required): #{ticket_props[:drop_cont] if not nil}"
    puts "[5] TIME READY (default: now): #{ticket_props[:time_ready].to_s}"
    puts "[6] CUSTOM TIME DUE: #{ticket_props[:time_due].to_s if not nil}"
    puts "[7] RUSH? #{ticket_props[:rush].to_s}"
    puts "[8] OVERSIZE? #{ticket_props[:os].to_s}"
    puts "[9] NOTES?: #{ticket_props[:notes]}"
    puts "====================================================="
    puts ""
    puts "Type the numbner of the option you wish to edit."
    puts "Please ensure all required fields are filled out."
    puts ""
    puts "Press [0] to select a different client"
    puts ""
    puts ticket_props[:client].address
    puts ticket_props[:client].contact_person
    puts ticket_props[:client].contact_phone
    puts ""
    puts "Type [pick] to use this client's contact and address for pickup information."
    puts ""
    puts "Type [drop] to use this client's contact and address for dropoff information."
    puts "\nTo save this ticket, type [s] and press enter!"
  end

  refresh(ticket_props)

  def prompt(c)
    print "\n> "
    res = gets.chomp.downcase
    puts "\n"

    case res
    when 'pick'
      ticket_props[:pu_addr] = c.address
      ticket_props[:pu_cont] = c.contact_person + " - " + c.contact_phone
      refresh(ticket_props)
      prompt(c)
    when 'drop'
      ticket_props[:drop_addr] = c.address
      ticket_props[:drop_cont] = c.contact_person + " - " + c.contact_phone
      prompt(c)
    when '0'
      ticket_props[:client] = pick_client
    when '1'
      update({hash:c,key:'pu_addr',str:'pickup address'})
    when '2'
      update({hash:c,key:'pu_contact',str:'pickup contact information'})
    when '3'
      update({hash:c,key:'drop_addr',str:'dropoff address'})
    when '4'
      update({hash:c,key:'drop_cont',str:'dropoff contact information'})
    when '5'
      puts 'not implimented. press enter'
      gets
    when '6'
      puts 'not implimented'
      gets
    when '7'
      ticket_props[:rush] = !ticket_props[:rush]
      refresh(ticket_props)
    when '8'
      ticket_props[:os] = !ticket_props[:os]
      refresh(ticket_props)
    when '9'
      update({hash:c,key:'notes',str:'notes'})
    else
      puts 'Returning to ticket menu...'
      puts 'Press Enter'
      gets
      clear_screen
      ticket_board_menu
    end
  end
  prompt(c)
end
