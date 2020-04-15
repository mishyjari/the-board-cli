require_relative "../../../config/environment.rb"    

def ticket_complete_form(t)
  puts "Ticket complete form for #{t.id}"
  gets
  clear_screen
  ticket_detail(t)
  ticket_detail_menu(t)
end

