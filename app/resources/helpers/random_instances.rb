require_relative "../../../config/environment.rb"
def random_courier
  Courier.create(
    name: Faker::Name.name,
    email: Faker::Internet.safe_email,
    phone: Faker::PhoneNumber.cell_phone
  )
end

def random_client
  Client.create(
    name: Faker::Company.name,
    address: Faker::Address.street_address,
    contact_person: Faker::Name.name,
    contact_phone: Faker::PhoneNumber.phone_number
  )
end

def random_ticket
  
  def toss(n=50)
    rand(1..100) < n
  end

  def status
    statuses = ['pending','unassigned','incomplete']
    statuses[rand(statuses.length)]
  end
  
  def courier
    if status == 'pending' || status == 'unassigned'
      nil
    else
      c = Courier.all[rand(Courier.all.length)]
      c.id
    end
  end
  def client
    num_clients = Client.all.length
    num_clients == 0 ? Client.create(name: "GUEST-#{Time.now.ctime}") : Client.all[rand(num_clients)]
  end
  def delivered
    status == 'delivered' ? Time.now : nil
  end
  Ticket.create(
    client_id: client.id,
    courier_id: courier,
    pickup_address: client.address,
    pickup_contact: client.contact_phone,
    dropoff_address: Faker::Address.street_address,
    dropoff_contact: Faker::PhoneNumber.phone_number,
    rush: toss,
    oversize: toss,
    status: status,
    pod: nil,
    time_delivered: nil,
    time_ordered: Time.now - rand(200).minutes,
    time_ready: Time.now - rand(20).minutes

  )
end

def random_completed_ticket
  def client
    num_clients = Client.all.length
    num_clients == 0 ? Client.create(name: "GUEST-#{Time.now.ctime}") : Client.all[rand(num_clients)]
  end
  def courier_id
    num_couriers = Courier.all.length
    num_couriers == 0 ? nil : Courier.all[rand(num_couriers)].id
  end
  Ticket.create(
    client_id: client.id,
    courier_id: courier_id,
    pickup_address: client.address,
    pickup_contact: client.contact_phone,
    dropoff_address: Faker::Address.street_address,
    dropoff_contact: Faker::PhoneNumber.phone_number,
    rush: toss,
    oversize: toss,
    status: 'complete',
    pod: Faker::Name.name,
    time_delivered: Time.now - rand(200).hours,
    time_ordered: Time.now - rand(200..250).hours,
    time_ready: Time.now - rand(200..250).hours
  )
end
