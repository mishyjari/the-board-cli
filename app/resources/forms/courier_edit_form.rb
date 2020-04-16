require_relative "../../../config/environment.rb"

def courier_edit_menu(c)
  
  clear_screen

  courier_detail(c)

  puts "\nThis menu has not been implemented yet. Press enter to return to details page for #{c.name}"

  # Edit name
  # Toggle #active bool
  # Delete
  # Framework to edit 'nickname', 'email' and phone if we get sround to making that migration

  gets

  clear_screen
  courier_detail(c)
  courier_detail_menu(c)
end
