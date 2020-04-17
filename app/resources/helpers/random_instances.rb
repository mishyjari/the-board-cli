require_relative "../../../config/environment.rb"
def random_courier(n=1)
  Courier.create(
    name: Faker::Name.name,
    email: Faker::Internet.safe_email,
    phone: Faker::PhoneNumber.cell_phone
  )
end

def random_client(n=1)
  Client.create(
    name: Faker::Company.name,
    address: Faker::Address.street_address,
    contact_person: Faker::Name.name,
    contact_phone: Faker::PhoneNumber.phone_number
  )
end

def random_ticket(n=1)
  def toss(n=50)
    rand(1..100) < n
  end
  def status
    statuses = ['pending','unassigned','incomplete','complete']
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
  def pod
    status == 'complete' ? Faker::Name.name : nil
  end
  def client
    num_clients = Client.all.length
    Client.all[rand(num_clients)]
  end
  def delivered
    status == 'delivered' ? Time.now : nil
  end
  Ticket.create(
    client_id: client.id,
    courier_id: courier,
    pickup_address: client.address,
    pickup_contact: client.contact_phone,
    delivery_address: Faker::Address.steet_address,
    delivery_contact: Faker::PhoneNumber.phone_number,
    rush: toss,
    os: toss,
    status: status,
    pod: pod,
    time_delivered: delivered
  )
end

