require_relative '../../../config/environment.rb'

# Pretty much just waiting on the time helper method to work before building this out.

def new_ticket_form(client)

  # PU Address
  puts "\nPlease enter the full address, including suite/apartment number where we will pick up the package:"
  puts "If we are picking up from the address this client: "
  puts "  #{client.address}"
  puts "Just press enter"
  pick = gets.chomp
  print "Pickup Address: #{pick}\n"
  puts "If this is correct, press enter, else type it again"
  print "/n> "
  confirm = gets.chomp
  while confirm.length != 0 do
    pick = gets.chomp
    print "Pickup Address: #{pick}\n"
    puts "If this is correct, press enter, else type it again"
    print "/n> "
    confirm = gets.chomp
  end
  
  # PU Contact
  puts "\nPlease specify pickup contact information (contact person, phone number, 'reception desk' etc)"
  puts "If the contact information on file for this client will suffice, just press enter."

  # DROP OFF Address
  puts "\nAnd now, the drop-off address:"
  drop = gets.chomp
  puts "Dropoff address: #{drop}"

  # DROP OFF Contact
  # Oversize
  # Time ready
  # Time due / rush
  # Notes


  puts "Under development! Sorries! Press enter to return to tickets menu"
  gets.chomp
end
