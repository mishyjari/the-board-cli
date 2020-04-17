# CLI Tool to Create New Client Instance
require_relative "../../../config/environment.rb"

class NewClient
  attr_accessor :name, :address, :contact_phone, :contact_person
  def initialize
    @name = nil
    @address = nil
    @contact_phone = nil
    @contact_person = nil
  end

  def menu
    puts "\n====================  NEW CLIENT  ==================="
    puts "[0] NAME: #{@name if not nil}"
    puts "[1] ADDRESS: #{@address if not nil}"
    puts "[2] CONTACT PERSON: #{@contact_person if not nil}"
    puts "[3] CONTACT PHONE: #{@contact_phone if not nil}"
    puts ""
    puts "[save] Type 'save' to SAVE THIS CLIENT"
    puts "=====================================================\n"
    puts "  [t] Switch to TICKETS MENU"
    puts "  [i] Back to CLIENT MENU"
    puts "  [c] Switch to COURIERS MENU"
    puts "  [m] Back to MAIN MENU"
    puts "  [x] EXIT application"
  end

  def form
    clear_screen
    menu

    print "\n> "
    res = gets.chomp.downcase

    case res
    when '0'
      @name = update("NAME")
      form
    when '1'
      @address = update('ADDRESS')
      form
    when '2'
      @contact_person = update('CONTACT PERSON')
      form
    when '3'
      @contact_phone = update('CONTACT PHONE')
      form
    when 'save'
      create_client
    when 'm'
      clear_screen
      confirm_exit('main menu') ? main_menu : form
    when 't'
      clear_screen
      confirm_exit('tickets menu') ? ticket_board_menu : form
    when 'i'
      clear_screen
      confirm_exit('clients menu') ? client_board_menu : form
    when 'c'
      clear_screen
      confirm_exit('couriers menu') ? courier_board_menu : form
    when 'x'
      clear_screen
      confirm_exit('system console') ? exit : form
    else
      form
    end
  end

  def create_client
    if validate
      client = Client.create(
        name: @name,
        address: @address,
        contact_person: @contact_person,
        contact_phone: @contact_phone
      )
      clear_screen
      puts "\nClient saved! Redirecting to the client detail page..."
      puts "Press enter to continue."
      gets
      clear_screen
      client_detail(client)
      client_detail_menu(client)
    else
      clear_screen
      puts "\nALL FIELDS REQUIRED!"
      puts "Press enter to continue."
      gets
      form
    end
  end

  def validate
    @name && (@name.length > 0) &&
    @address && (@address.length > 0) &&
    @contact_phone && (@contact_phone.length > 0) &&
    @contact_person && (@contact_person.length > 0)
  end

  def confirm_exit(str)
    clear_screen
    puts "\nDISCARD CLIENT AND EXIT TO #{str.upcase}?"
    print "(y/n)> "
    confirm = gets.chomp.downcase
    clear_screen
    confirm == 'y' ? true : false
  end

  def update(prompt)
    clear_screen
    self.menu
    print "\n#{prompt}: > "
    res = gets.chomp
    res
  end
end
