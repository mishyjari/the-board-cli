require_relative "../../../config/environment.rb"

def ticket_assign_menu(t)
  puts "\n========================== TICKET ASSIGNMENT ============================\n"
  puts "\nOPTIONS"
  puts "  [:id] Enter the ID of the courier to be assigned"
  puts ""
  puts "  [c] Show all active COURIERS"
  puts "  [r] Show all  CLEAR couriers"
  puts ""
  puts "  [d] Return to DETAILS view for this ticket without assigning"

  print "\n> "
  res = gets.chomp.downcase
  puts "\n"

  case res
  when 'c'
    clear_screen
    ticket_detail(t)
    puts "\nACTIVE COURIERS\n"
    list_couriers(Courier.all.active_couriers)
    ticket_assign_menu(t)
  when 'r'
    clear_screen
    ticket_detail(t)
    puts "\nCLEAR COURIERS\n"
    list_couriers(Courier.all.clear_couriers)
    ticket_assign_menu(t)
  when 'd'
    clear_screen
    ticket_detail(t)
    ticket_detail_menu(t)
  else
    begin
      c = Courier.find(res.to_i)
      t.assign(c)
      clear_screen
      ticket_detail(t)
      puts "\nSuccessfully assigned to #{c.name}."
      puts "Press enter to return to tickets menu"
      gets
      clear_screen
    rescue
      puts "\nInvalid response. Press enter."
      gets
      clear_screen
      ticket_detail(t)
      ticket_assign_menu(t)
    end
  end
end
