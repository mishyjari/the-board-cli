require_relative '../../../config/environment.rb'

# This form is for clients' use to be able to create a new ticket instance.

def client_ticket_form
  puts "You can use this form to make a new delivery request."
  puts "Just type your responses and press [enter] to submit."
  puts "If you made a mistake, you can type 'restart' to go back to the beginning."

  puts "\nPlease enter the full address, including suite/apartment number where we will pick up the package:"
  pick = gets.chomp
    client_ticket_form if pick.downcase = "restart"
  puts "Pickup Address: #{pick}"

  puts "\nAnd now, the drop-off address:"
  drop = gets.chomp
    client_ticket_form if drop.downcase = "restart"
  puts "Dropoff address: #{drop}"

  puts "Under development! Sorries! Press enter to get outta here."
  gets.chomp
end
