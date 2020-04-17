require_relative "../../../config/environment.rb"

class NewCourier
  attr_accessor :name, :active, :email, :phone
  def initialize
    @name = nil
    @active = true
    @email = nil
    @phone = nil
  end

  def menu
    puts "\n====================  NEW CLIENT  ==================="
    puts "[0] NAME: #{@name if not nil}"
    puts "[1] ACTIVE? #{active.to_s}"
    puts "[2] PHONE: #{@phone if not nil}"
    puts "[3] EMAIL: #{@email if not nil}"
    puts ""
    puts "[save] Type 'save' to SAVE THIS CLIENT"
    puts "=====================================================\n"
    puts "  [t] Switch to TICKETS MENU"
    puts "  [m] Back to MAIN MENU"
    puts "  [i] Back to CLIENT MENU"
    puts "  [c] Switch to COURIERS MENU"
    puts "  [x] EXIT Application"
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
      @active = !@active
      form
    when '2'
      @phone = update('PHONE NUMBER')
      form
    when '3'
      @email = update('EMAIL ADDRESS')
      form
    when 'save'
      create_courier
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

  def create_courier
    if @name && @name.length > 0
      courier = Courier.create(
          name: @name,
          active: @active,
          phone: @phone,
          email: @email
        )
      clear_screen
      puts "\nCourier saved! Redirecting to the courierdetail page..."
      puts "Press enter."
      gets
      clear_screen
      courier_detail(courier)
      courier_detail_menu(courier)
    else
      clear_screen
      puts "\nNAME IS REQUIRED!"
      puts "Press enter."
      gets
      form
    end
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
    menu
    print "\n#{prompt}: > "
    res = gets.chomp
    res
  end
end
