require_relative "../../../config/environment.rb"

def courier_detail(c)
  puts "\nDETAILS FOR COURIER #{c.id.to_s}: #{c.name}"
  puts "ACTIVE? #{c.active.to_s.upcase}"
  puts "  Packages today: #{c.tickets_today_by_courier.length.to_s}"
  if c.late_packages_by_courier.length > 0
    puts "  LATE PACKAGES:"
    list_tickets(c.late_packages_by_courier)
  end
  if c.incomplete_tickets_by_courier.length > 0
    puts "  Incomplete packages: "
    list_tickets(c.incomplete_tickets_by_courier)
  else
    puts "  #{c.name} has no incomplete tickets."
  end
end

