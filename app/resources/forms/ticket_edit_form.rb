require_relative "../../../config/environment.rb"    

def ticket_edit_form(t)
  puts "Ticket edit form for #{t.id}"
  puts "Not Implimented. Press Enter"
  gets
  clear_screen
  ticket_detail(t)
  ticket_detail_menu(t)
end

