require_relative "../../../config/environment.rb"

def clear_screen
  puts `clear`
  header
end

def header
  puts "####### ##   ## #######  ######    ###      #    #####  #####"
  puts "  ##    ##   ## ##       ##   ## ##   ##   # #   ##   # ##   #"
  puts "  ##    ####### ####     ## ###  ##   ##  #####  ###### ##   ##"
  puts "  ##    ##   ## ##       ##   ## ##   ## ##   ## ##  #  ##   #"
  puts "  ##    ##   ## #######  ######    ###   ##   ## ##   # #####"
  puts "######################   #{Time.now.to_date}   #########################"
end

def exit
  puts 'Goodbye!'
end
