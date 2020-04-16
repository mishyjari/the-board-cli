require_relative "../../../config/environment.rb"

def list_couriers(array)
  array.each do |c|
    puts "ID: #{c.id} | #{c.name}"
    puts "  Holding #{c.incomplete_tickets_by_courier.length.to_s} packages, total today: #{c.tickets_today_by_courier.length.to_s}"
  end
end
