require_relative "../app/resources/helpers/random_instances.rb"

Ticket.delete_all
Courier.delete_all
Client.delete_all

8.times do random_courier end
20.times do random_client end
#random_ticket(50)
