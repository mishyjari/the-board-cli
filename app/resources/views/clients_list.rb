require_relative "../../../config/environment.rb"

def list_all_clients
  puts "\n"
  Client.all.each do |c|
    puts "ID: #{c.id} | #{c.name}"
  end
  puts "\n"
end
