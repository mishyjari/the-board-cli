require_relative "../../../config/environment.rb"    

def ticket_delete_form(t)
  puts "Ticket delete form for #{t.id}"
  puts "Not Implimented, Press Enter"
  gets
  clear_screen
  ticket_detail(t)
  ticket_detail_menu(t)
end

