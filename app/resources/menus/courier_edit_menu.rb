require_relative "../../../config/environment.rb"

def courier_edit_menu(c)

  puts "=============================== EDIT COURIER DETAILS =================================="
  puts "\nSOOOOOOMEONE BUILD ME PLEAAAAASE?"
  puts "\nI'm over here at app/resources/menus/courier_edit_menu.rb"

  # Edit name
  # Toggle #active bool
  # Delete
  # Framework to edit 'nickname', 'email' and phone if we get sround to making that migration

  puts "\n\nI'll just go away till you do. Press enter and leave me to my ether of non-existence."
  gets
  clear_screen
  courier_detail(c)
  courier_edit_menu(c)
end
