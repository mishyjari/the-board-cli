require_relative "../app/resources/helpers/random_instances.rb"

Ticket.delete_all
Courier.delete_all
Client.delete_all

8.times do random_courier end
30.times do random_client end
25.times do random_ticket end
100.times do random_completed_ticket end
