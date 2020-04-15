require_relative "../../../config/environment.rb"    

def ticket_complete_form(t)
  clear_screen
  ticket_detail(t)
  puts "\nCOMPLETE TICKET\n"
  # Check if ticket has been assigned or not!
  if !t.courier_id
    puts "This ticket has not been assigned to a courier!"
    puts "Would you like to assign before completion?"
    
    print "(y/n)> "
    res = gets.chomp.downcase
    puts "\n"

    case res
    when 'y'
      clear_screen
      ticket_detail(t)
      ticket_assign_menu(t)
      ticket_detail(t)
    when 'n'
      puts "Completing without assignment..."
    else
      clear_screen
      puts "Type 'y' to assign a courier, 'n' to complete without assignment, or press enter to return to ticket details."
      ticket_complete_form(t)
    end
  end

  # Get the POD
  puts "Please enter the POD (Point-of-delivery)."
  puts "e.g., 'Mrs. Smith, reception"
  
  print "\n> "
  pod = gets.chomp
  puts "\n"

  puts "Received by #{pod}"

  puts "\nCustom Delivery time not implemented. Defaulting to current time."

  # Allow for notes to be added to ticket
  puts "\nAdd custom delivery notes or details? (Leave blank and press enter to skip)"
  print "> "
  note = gets.chomp
  t.add_note(note) if note.length != 0

  t.complete(pod)

  # Display ticket detail and exit
  clear_screen
  ticket_detail(t)
  puts "\nTicket completed. Press enter to return to tickets menu"
  gets
  clear_screen
  ticket_board_menu
end

