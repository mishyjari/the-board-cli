require_relative "../../../config/environment.rb"

def client_detail(c)
  puts "\nCLIENT DETAILS FOR CLIENT ##{c.id.to_s}"
  puts "  Name: #{c.name}"
  puts "  Address: #{c.address}"
  puts "  Contact: #{c.contact_person} | #{c.contact_phone}\n"
end
