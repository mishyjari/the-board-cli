require_relative "../../../config/environment.rb"

def courier_detail_menu(c)

  puts "\nOPTIONS:"
  puts "  [a] Mark courier ACTIVE" if !c.active
  puts "  [a] Mark courier INACTIVE" if c.active
  puts "  [t] All TICKETS TODAY assigned to #{c.name}"
  puts "  [d] Tickets by DATE assigned to #{c.name}"
  puts "  [e] EDIT details for #{c.name}"
  puts ""
  puts "  [c] Back to COURIERS MENU"
  puts "  [m] Back to MAIN MENU"
  puts "  [x] EXIT application"

  print "\n> "
  res = gets.chomp.downcase
  puts "\n"

  case res
  when "a"
    c.toggle_active_for_courier
    clear_screen
    courier_detail(c)
    courier_detail_menu(c)
  when "t"
    clear_screen
    courier_detail(c)
    puts "\nALL TICKETS TODAY BY #{c.name.upcase}"
    list_tickets(c.tickets_today_by_courier)
    puts ""
    courier_detail_menu(c)
  when "d"
    puts "Date search features have not been implemented yet!!\n"
    puts "We've gotta build out a user-friendly way of interpolating human-friendly date strings into date objects."
    puts "There is a method in the courier model #courier_tickets_by_date_range(d1,d2) to select the tickets."
    puts "But this should be painless for the user to enter two dates and get back Time instances."
    puts "Check out /app/resources/helpers/get_time.rb for a partially built out helper method for this"
    puts "\npress enter for now."
    gets
    clear_screen
    courier_detail(c)
    courier_detail_menu(c)
  when "e"
    clear_screen
    courier_detail(c)
    courier_edit_menu(c)
  when "c"
    clear_screen
    courier_board_menu
  when "m"
    main_menu
  when "x"
    clear_screen
    exit
  else
    puts "Invalid input. Press enter."
    gets
    clear_screen
    courier_detail(c)
    courier_detail_menu(c)
  end
end
