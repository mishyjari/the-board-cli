require_relative "../../../config/environment.rb"

def ticket_assign_menu(t)
  puts "\n========================== TICKET ASSIGNMENT ============================\n"
  puts "\nOPTIONS"
  puts "  [:id] Enter the ID of the courier to be assigned"
  puts ""
  puts "  [c] Show all active couriers"
  puts "  [r] Show all clear couriers"
  puts ""
  puts "  [b] Return to details view for this ticket without assigning"

  print "\n> "
  res = gets.chomp.downcase
  puts "\n"

  case res
  when 'c'
    clear_screen
    ticket_detail(t)
    list_couriers('active')
    ticket_assign_menu(t)
  when 'r'
    clear_screen
    ticket_detail(t)
    list_couriers('clear')
    ticket_assign_menu(t)
  when 'b'
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
      puts "Press enter"
      gets
      clear_screen
    rescue
      puts "\nInvalid response. Press enter."
      gets
      clear_screen
      ticket_detail(t)
      ticket_detail_menu(t)
    end
  end
end
