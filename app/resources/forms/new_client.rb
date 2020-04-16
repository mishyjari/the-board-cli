# CLI Tool to Create New Client Instance
require_relative "../../../config/environment.rb"

def new_client_form
  puts "Create New Client Tool\n"

  print "Client Name: "
  name = gets.chomp
  while name.length == 0 do
    puts 'Client name can not be blank!'
    print 'Name: '
    name = gets.chomp
  end

  print "Full Client Address: "
  addr = gets.chomp
  while addr.length == 0 do
    puts 'Address can not be blank!'
    print 'Address: '
    addr = gets.chomp
  end

  print "Contact Person: "
  person = gets.chomp
  while person.length == 0 do
    puts 'Contact Person can not be blank!'
    print 'Contact Person: '
    person = gets.chomp
  end

  print "Contact Phone Number: "
  phone = gets.chomp
  while phone.length == 0 do
    puts 'Phone number can not be blank!'
    print 'Contact Phone: '
    phone = gets.chomp
  end

  puts "\nDoes this look right?\n"

  puts name
  puts addr
  puts person
  puts phone

  puts "\n[y] YES! Create Client."
  puts "[n] NO! I goofed! Edit Client info"
  puts "[i] Cancel create new client, return to CLIENT MENU"
  res = gets.chomp.downcase

  case res
  when 'y'
    c = Client.create(name: name,
                  address: addr,
                  contact_person: person,
                  contact_phone: phone)
    puts "#{c.name} created! Press enter to exit"
    gets.chomp
  when 'n'
    puts "That's okay! Lets try again."
    new_client_form
  when 'i'
    client_board_menu
  else
    puts "Ooops! That was a yes or no question, and your developers haven't handled this yet, so you've gotta start over."
    new_client_form
  end
end

#new_client_form
