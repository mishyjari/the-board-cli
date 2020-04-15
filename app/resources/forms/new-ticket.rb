require_relative '../../../config/environment.rb'

# Pretty much just waiting on the time helper method to work before building this out.

def new_ticket_form
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

  puts "Under development! Sorries! Press enter to return to tickets menu"
  gets.chomp
end
