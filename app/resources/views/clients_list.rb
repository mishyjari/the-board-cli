require_relative "../../../config/environment.rb"

def list_clients(array)
  array.each do |c|
    puts "ID: #{c.id} | #{c.name} | #{c.address}"
  end
end
