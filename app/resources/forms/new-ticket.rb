require_relative '../../../config/environment.rb'

# Pretty much just waiting on the time helper method to work before building this out.

def new_ticket_form(client)

  def ni(c)
    puts "\nNew ticket menu under development."
    puts "Press enter to continue or [m] to return to the main menu"
    print "\n> "
    res = gets.chomp.downcase
    if res == "m"
      main_menu
    else
      new_ticket_form(c)
    end
  end

  puts "====================  NEW TICKET  ==================="
  puts "[0] CLIENT: #{client.name}"
  puts "[1] PICKUP ADDRESS (required): #{pu_addr if pu_addr}"
  puts "[2] PICKUP CONTACT (required): #{pu_cont if pu_cont}"
  puts "[3] DROPOFF ADDRESS (required): #{drop_addr if drop_addr}"
  puts "[4] DROPOFF CONTACT (required): #{drop_cont if drop_cont}"
  puts "[5] TIME READY (default: now): #{time_ready.to_s if time_ready}"
  puts "[6] CUSTOM TIME DUE or RUSH?: #{time_due.to_s if time_due} #{RUSH if rush}"
  puts "[7] OVERSIZE? (default: no): #{'YES' if os}"
  puts "[8] NOTES?: #{notes if notes}"
  puts "====================================================="
  puts ""
  puts "Type the numbner of the option you wish to edit."
  puts "Please ensure all required fields are filled out."
  puts ""
  puts "Press [0] to select a different client"
  puts ""
  puts client.address
  puts client.contact_person
  puts client.contact_phone
  puts ""
  puts "Type [pick] to use this client's contact and address for pickup information."
  puts ""
  puts "Type [drop] to use this client's contact and address for dropoff information."

  print "\n> "
  puts "\n"

  case res
  when 'pick'
    pu_addr = client.address
    pu_cont = client.contact_person + " | " + client.contact_phone
  when 'drop'
    drop_addr = client.address
    drop_cont = client.contact_person + " | " + client.contact_phone
  when '0'
    ni(client)
  when '1'
    ni(client)
  when '2'
    ni(client)
  when '3'
    ni(client)
  when '4'
    ni(client)
  when '5'
    ni(client)
  when '6'
    ni(client)
  when '7'
    ni(client)
  when '8'
    ni(client)
  else
    puts 'Returning to ticket menu...'
    puts 'Press Enter'
    gets
    clear_screen
    ticket_board_menu
  end

end
