require_relative '../../../config/environment.rb'

class NewTicket

def self.menu(data)

  client = data[:client]

  puts "\n<====================  NEW TICKET  ==================="
  puts "[0] CLIENT: #{client[:name]}"
  if client[:name] != "Guest" && client.has_contact_info
    puts "  Address: #{client.address}"
    puts "  Contact: #{client.contact_person if not nil}"
    puts "  Phone: #{client.contact_phone if not nil}"
  end
  puts "[1] PICKUP ADDRESS (required): #{data[:pu_addr] if not nil}"
  puts "[2] PICKUP CONTACT (required): #{data[:pu_cont] if not nil}"
  puts "[3] DROPOFF ADDRESS (required): #{data[:drop_addr] if not nil}"
  puts "[4] DROPOFF CONTACT (required): #{data[:drop_cont] if not nil}"
  puts "[5] TIME READY (default: now): #{data[:time_ready].to_s}"
  puts "[6] CUSTOM TIME DUE: #{data[:time_due].to_s if not nil}"
  puts "[7] RUSH? #{data[:rush].to_s}"
  puts "[8] OVERSIZE? #{data[:os].to_s}"
  puts "[9] NOTES?: #{data[:notes]}"
  puts ""
  if client[:name] != "Guest" && client.has_contact_info
    puts "To set PICKUP ADDRESS + CONTACT to #{client[:name].upcase}'s, type 'pick'"
    puts "To set DROPOFF ADDRESS + CONTACT to #{client[:name].upcase}'s, type 'drop'"
  end
  puts "Type 'save' to save this ticket."
  puts "========================================================\n"
  puts "  [t] BACK to TICKETS MENU"
  puts "  [m] Back to MAIN MENU"
  puts "  [i] Switch to CLIENT MENU"
  puts "  [c] Switch to COURIERS MENU"
  puts "  [x] EXIT Application"
end

def self.form(data:nil)
####  REQUIRES DATA HASH FROM new_ticket_menu()  ####

  if !data
    data = {
      client: {
        name: 'Guest',
        has_contact_info: false,
        id: 99999
      },
      pu_addr: nil,
      pu_cont: nil,
      drop_addr: nil,
      drop_cont: nil,
      time_ready: Time.now,
      time_due: nil,
      rush: false,
      os: false,
      notes: ""
    }
  end
  client = data[:client]

  NewTicket.menu(data)

  print "\n> "
  res = gets.chomp.downcase

#  binding.pry

  case res
  when 'pick'
    data[:pu_addr] = client[:address]
    data[:pu_cont] = "#{client[:contact_person]} | #{client[:contact_phone]}"

    clear_screen
    NewTicket.form(data:data)
  when 'drop'
    data[:drop_addr] = client[:address]
    data[:drop_cont] = "#{client[:contact_person]} | #{client[:contact_phone]}"

    clear_screen
    NewTicket.form(data:data)
  when '0' # CHANGE CLIENT
    clear_screen
    res = ''
    while res.length == 0 do
      puts "\nSELECT CLIENT FOR NEW TICKET"
      puts "  [:id] Show client details by ID"
      puts "  [a] ALL Clients"
      puts "  [t] Clients with open TICKETS"
      puts "  [b] Go BACK to New Ticket Form"
      puts "WARNING: FOLLOWING OPIONS WILL DISCARD THIS TICKET"
      puts "  [c] Switch to COURIERS MENU"
      puts "  [m] Switch to MAIN MENU"
      puts "  [t] Back to TICKETS MENU"
      puts "  [x] EXIT Application"
      print "\n> "
      res = gets.chomp
      case res
      when 'a'
        clear_screen
        puts "\nALL CLIENTS:\n"
        list_clients(Client.all)
        res=''
      when 't'
        clear_screen
        puts "\nCLIENTS WITH OPEN TICKETS:\n"
        list_clients(Client.all.clients_with_incomplete_tickets)
        res=''
      when 'b'
        clear_screen
        NewTicket.form(data:data)
      when 'c'
        puts "DISCARD TICKET AND EXIT TO COURIERS MENU?"
        print "(y/n)> "
        res = gets.chomp.downcase
        if res == 'y'
          clear_screen
          courier_board_menu
        else
          res = ''
        end
      when 'm'
        puts "DISCARD TICKET AND EXIT TO MAIN MENU?"
        print "(y/n)> "
        res = gets.chomp.downcase
        if res == 'y'
          main_menu
        else
          res = ''
        end
      when 't'
        puts "DISCARD TICKET AND EXIT TO TICKETS MENU?"
        print "(y/n)> "
        res = gets.chomp.downcase
        if res == 'y'
          clear_screen
          tickets_board_menu
        else
          res = ''
        end
      when 'x'
        puts "DISCARD TICKET AND CLOSE APPLICATION?"
        print "(y/n)> "
        res = gets.chomp.downcase
        if res == 'y'
          courier_board_menu
        else
          res = ''
        end
      else
        begin
          c = Client.find(res.to_i)
          data[:client] = c
          clear_screen
          NewTicket.form(data:data)
        rescue
          res = ""
        end
    end
  end
  when '1'
    clear_screen
    NewTicket.menu(data)
    print "\nPICKUP ADDRESS: > "
    addr = gets.chomp
    data[:pu_addr] = addr

    clear_screen
    NewTicket.form(data:data)
  when '2'
    clear_screen
    NewTicket.menu(data)
    print "\nPICKUP CONTACT: > "
    cont = gets.chomp
    data[:pu_cont] = cont

    clear_screen
    NewTicket.form(data:data)
  when '3'
    clear_screen
    NewTicket.menu(data)
    print "\nDROPOFF ADDRESS: > "
    addr = gets.chomp
    data[:drop_addr] = addr

    clear_screen
    NewTicket.form(data:data)
  when '4'
    clear_screen
    NewTicket.menu(data)
    print "\nDROPOFF CONTACT: > "
    cont = gets.chomp
    data[:drop_cont] = cont

    clear_screen
    NewTicket.form(data:data)
  when '5'
    puts 'Datetime methods not implemented. Press enter'
    gets
    clear_screen
    NewTicket.form(data:data)
  when '6'
    puts 'Datetime methods not implemented. Press enter'
    gets
    clear_screen
    NewTicket.form(data:data)
  when '7'
    data[:rush] = !data[:rush]
    clear_screen
    NewTicket.form(data:data)
  when '8'
    data[:os] = !data[:os]
    clear_screen
    NewTicket.form(data:data)
  when '9' # NOTES
    clear_screen
    NewTicket.menu(data)
    print "\nNEW NOTE: > "
    new_note = gets.chomp

    data[:notes] += "#{new_note}\n"

    clear_screen
    NewTicket.form(data:data)
  when 'save'
    validation = (data[:pu_addr] && data[:pu_cont] && data[:drop_addr] && data[:drop_cont])
    if validation
      c = Client.create(name: "GUEST-#{Time.now.ctime}")
      t = Ticket.create(pickup_address: data[:pu_addr],
                  pickup_contact: data[:pu_cont],
                  dropoff_address: data[:du_addr],
                  dropoff_contact: data[:du_cont],
                  rush: data[:rush],
                  notes: data[:notes],
                  oversize: data[:os],
                  time_ready: data[:time_ready],
                  time_ordered: Time.now,
                  time_due: data[:time_due],
                  client_id: c.id
                )
      clear_screen
      puts "\nTicket saved! Press enter."
      gets
      clear_screen
      ticket_detail(t)
      ticket_detail_menu(t)
    else
      puts 'Please make sure all required fields are filled out!'
      puts 'press enter'
      gets
      clear_screen
      NewTicket.form(data:data)
    end
  when 'i'
    puts "DISCARD TICKET AND EXIT TO CLIENTS MENU?"
    print "(y/n)> "
    res = gets.chomp.downcase
    if res == 'y'
      clear_screen
      client_board_menu
    else
      clear_screen
      NewTicket.form(data:data)
    end
  when 't'
    puts "DISCARD TICKET AND EXIT TO TICKETS MENU?"
    print "(y/n)> "
    res = gets.chomp.downcase
    if res == 'y'
      clear_screen
      tivket_board_menu
    else
      clear_screen
      NewTicket.form(data:data)
    end
  when 'c'
    puts "DISCARD TICKET AND EXIT TO COURIERS MENU?"
    print "(y/n)> "
    res = gets.chomp.downcase
    if res == 'y'
      clear_screen
      courier_board_menu
    else
      clear_screen
      NewTicket.form(data:data)
    end
  when 'm'
    puts "DISCARD TICKET AND EXIT TO MAIN MENU?"
    print "(y/n)> "
    res = gets.chomp.downcase
    if res == 'y'
      main_menu
    else
      clear_screen
      NewTicket.form(data:data)
    end
  when 'x'
    puts "DISCARD TICKET AND CLOSE APPLICATION?"
    print "(y/n)> "
    res = gets.chomp.downcase
    if res == 'y'
      clear_screen
      exit
    else
      clear_screen
      NewTicket.form(data:data)
    end
  else
    clear_screen
    NewTicket.form(data:data)
  end
end
end


#NewTicket.form
#NewTicket.form(NewTicket.menu)
