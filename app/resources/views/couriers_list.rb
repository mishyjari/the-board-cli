require_relative "../../../config/environment.rb"

def list_couriers
  puts "############ ACTIVE COURIERS ################\n"
  Courier.active_couriers.each do |c|
    puts "\nID ##{c.id.to_s} - #{c.name}"
    puts "  Holding #{c.incomplete_tickets_by_courier.length.to_s} packages\n"
  end
  puts "\n"
end
