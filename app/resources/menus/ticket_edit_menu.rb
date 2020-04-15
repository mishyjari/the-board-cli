require_relative "../../../config/environment.rb"    

def ticket_edit_menu(t)
  clear_screen
  ticket_detail(t)
  puts "\n======================== EDIT TICKET =======================\n"

  puts "\nOPTIONS\n"
  puts "  [s] Change STATUS"
  puts "  [pa] Edit PICKUP ADDRESS"
  puts "  [pc] Edit PICKUP CONTACT"
  puts "  [da] Edit DROPOFF ADDRESS"
  puts "  [dc] Edit DROPOFF CONTACT"
  puts "  [td] Edit TIME DUE"
  puts "  [tr] Edit TIME READY"
  puts "  [os] Toggle OVERSIZE"
  puts ""
  puts "  [en] Edit NOTES"
  puts "  [an] Add to NOTES"
  puts ""
  puts "  [c] Assign to a different courier" if t.courier_id
  puts "  [u] Unassign from #{t.courier.name}" if t.courier_id
  puts "  [a] Assign to courier" if !t.courier_id
  puts "  [delete] DELETE Ticket"
  puts ""
  puts "  [b] BACK to Ticket Detail"
  puts "  [t] BACK to TICKETS Menu"
  puts "  [m] Back to MAIN MENU"
  puts "  [x] EXIT Application"

  print "\n> "
  res = gets.chomp.downcase
  
  clear_screen

  case res
  when "s"
    # Valid statuses are 'pending', 'unassigned', incomplete', and 'complete'
    clear_screen
    ticket_detail(t)
    puts "\nChanging status to:"
    puts "  [p] PENDING" if t.status != 'pending'
    puts "   ^ Option will unassign #{t.courier.name}" if t.courier_id && t.status != 'pending'
    puts "  [u] UNASSIGNED" if t.status != 'unassigned'
    puts "   ^ Option will unassign #{t.courier.name}" if t.courier_id && t.status != 'unassigned'
    puts "  [i] INCOMPLETE" if t.status != 'incomplete'
    puts "  [c] COMPLETE" if t.status != 'complete'
    puts "  Use any other key to cancel"

    print "\n> "
    status = gets.chomp.downcase
    puts "\n"

    clear_screen

    case status
    when "p"
      t.status = 'pending'
      t.unassign
      t.save
      ticket_detail(t)
      puts "Status updated, Press enter"
      gets
      clear_screen
      ticket_edit_menu(t)
    when "u"
      t.status = 'unassigned'
      t.unassign
      t.save
      ticket_detail(t)
      puts "Status updated, Press enter"
      gets
      clear_screen
      ticket_edit_menu(t)
    when "i"
      t.status = 'incomplete'
      t.save
      ticket_detail(t)
      puts "Status updated, Press enter"
      gets
      clear_screen
      ticket_edit_menu(t)
    when "c"
      # This should point over to ticket_complete_form, but that needs to not default back to ticket board
      t.status = 'complete'
      t.save
      ticket_detail(t)
      puts "Status updated, Press enter"
      gets
      clear_screen
      ticket_edit_menu(t)
    else
      clear_screen
      ticket_edit_menu(t)
    end
  when "pa"
    ticket_detail(t)
    print "\nChange pickup address to: "
    pickaddr = gets.chomp
    t.pickup_address = pickaddr
    t.save
    clear_screen
    ticket_detail(t)
    puts "\nAddress Updated. Press enter"
    gets
    clear_screen
    ticket_detail(t)
    ticket_edit_menu(t)
  when "pc"
    ticket_detail(t)
    print "\nChange pickup contact to: "
    pickcont = gets.chomp
    t.pickup_contact = pickcont
    t.save
    clear_screen
    ticket_detail(t)
    puts "\nContact Updated. Press enter"
    gets
    clear_screen
    ticket_detail(t)
    ticket_edit_menu(t)
  when "da"
    ticket_detail(t)
    print "\nChange delivery address to: "
    dropaddr = gets.chomp
    t.dropoff_address = dropaddr
    t.save
    clear_screen
    ticket_detail(t)
    puts "\nAddress Updated. Press enter"
    gets
    clear_screen
    ticket_detail(t)
    ticket_edit_menu(t)
  when "dc"
    ticket_detail(t)
    print "\nChange delivery contact to: "
    dropcont = gets.chomp
    t.dropoff_contact = dropcont
    t.save
    clear_screen
    ticket_detail(t)
    puts "\nContact Updated. Press enter"
    gets
    clear_screen
    ticket_detail(t)
    ticket_edit_menu(t)
  when "td"
    puts "Change times not implemented. Press enter"
    gets
    clear_screen
    ticket_detail(t)
    ticket_edit_menu(t)
  when "tr"
    puts "Change times not implemented. Press enter"
    gets
    clear_screen
    ticket_detail(t)
    ticket_edit_menu(t)
  when "os"
    t.oversize = !t.oversize 
    t.save
    puts "Oversize set to #{t.oversize.to_s}. Press enter"
    gets
    clear_screen
    ticket_detail(t)
    ticket_edit_menu(t)
  when "en"
    puts "Edit note not implemented. Use 'an' to add to note"
    puts "Press enter"
    gets.chomp
    clear_screen
    ticket_detail(t)
    ticket_edit_menu(t)
  when "an"
    puts "Enter your note:"
    print "\n> "
    note = gets.chomp
    t.add_note(note)
    puts "Notes: #{t.notes}"
    puts "Press enter"
    gets
    clear_screen
    ticket_detail(t)
    ticket_edit_menu(t)
  when "c"
    puts "Not implimented. Press enter"
    gets
    clear_screen
    ticket_detail(t)
    ticket_edit_menu(t)
  when "u"
    t.unassign
    puts "Unassigned. Press enter"
    clear_screen
    ticket_detail(t)
    ticket_edit_menu(t)
  when "a"
    puts "Not implimented. Press enter"
    gets
    clear_screen
    ticket_detail(t)
    ticket_edit_menu(t)
  when "delete"
    ticket_delete_form(t)
  when "b"
    clear_screen
    ticket_detail(t)
    ticket_detail_menu(t)
  when "t"
    clear_screen
    ticket_board_menu
  when "m"
    main_menu
  when "x"
    exit
  else
    clear_screen
    puts "Invalid response. Press enter to continue"
    gets
    clear_screen
    ticket_edit_menu(t)
  end
end

