require_relative "../../../config/environment.rb"

def list_couriers(type)
  # Acceptable type params: clear, active, all
  case type
  when 'clear'
    couriers = Courier.all.clear_couriers
  when 'active'
    couriers = Courier.all.active_couriers
  when 'all'
    couriers = Courier.all
  else
    puts "list_couriers method requires an argument of 'clear', 'active' or 'all'."
  end

  puts "\n#{type.upcase} COURIERS\n"
  couriers.each do |c|
    puts "ID: #{c.id} | #{c.name}"
    puts "  Holding #{c.incomplete_tickets_by_courier.length.to_s} packages, total today: (not implimented)"
  end
  puts "\n"
end
