require_relative "../config/environment.rb"

def greet
  puts 'hello'
end

def main_prompt
  puts "Select an option by typing the associated key followed by enter."
  puts "[t] View board by INCOMPLETE TICKETS"
  puts "[c] View board by ACTIVE COURIERS"
  puts "[i] View board by CLIENTS with OPEN TICKETS"
  puts "[s] View SEARCH options"
  puts "[x] EXIT"
  
  res = gets.chomp.downcase

  case res
    when "t"
      ticket_board_incomplete
    when "c"
      # Courier board
    when "i"
      # Client board
    when "s"
      # Search
    when "x"
      return
    else
      puts "Invalid Entry, try again!"
      main_prompt
  end
end

def ticket_board_incomplete
  puts "\n"
  Ticket.all.incomplete_jobs.each do |t|
    puts "######## JOB ID ##{t.id.to_s} ########"
    puts "  !!! LATE !!!" if t.time_due > Time.now
    puts "  STATUS: #{t.status}.upcase"
    puts "  Client: #{t.client.name}"
    puts "  Pickup: #{t.pickup_address}"
    puts "  Dropoff: #{t.dropoff_address}"
    puts "  Time Ordered: #{
  end
  gets.chomp
end
