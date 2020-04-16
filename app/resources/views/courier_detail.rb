require_relative "../../../config/environment.rb"

def courier_detail(c)
  puts "\nDETAILS FOR COURIER #{c.id.to_s}: #{c.name}"
  puts "  Holding now (not implemented)"
  puts "  Packages today (not implemented)"
  puts "  Late pkgs if late pkgs (not implemented)"
  puts "  List of incomplete tickets (not implemented)\n\n"
end

