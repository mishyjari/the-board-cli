Ticket.delete_all
Courier.delete_all
Client.delete_all

# Seed some clients
schmitt = Client.create(name: "Schmitt and Schmitt Law", address: "767 5th Ave. New York, NY")
ww = Client.create(name: "WeWork", address: "11 Broadway, New York, NY")
bdc = Client.create(name: "Brooklyn Design Co.", address: "250 Atlantic Ave., Brooklyn, NY")
mic = Client.create(name: "Millenium Investment Capital", address: "1270 Broadway, New York, NY")
ecc = Client.create(name: "Empire City Consultants", address: "203 W. Houston St, New York, NY")

# Seed some couriers
mishy = Courier.create(name: "Mishy Jari")
squid = Courier.create(name: "Kevin Boldger")
michelle = Courier.create(name: "Michelle Frattaroli")
austin = Courier.create(name: "Austin Horse")
kp = Courier.create(name: "Kevin Porter")

# Make some new tickets
  # Note that tickets have three statuses ['pending','assigned','complete']
    # pending == client has requested job but it hasn't been assigned / approved
    # assigned == ticket accepted by dispatch and assigned to courier
    # complete == package has been delivered

# Pending tickets
# Tickets will be submitted by a client, or in refrence to a client's information.
# Typically, the pickup address will be the client's address, but we will also encounter instances of 'outside picks' or both outside picks and outside drops.
# For now, we will make the seeds such that packages are picked up from client's office

# Schmitt has two going down and a hot one to LIC
t0 = Ticket.create(
  client_id: schmitt.id,
  pickup_address: schmitt.address,
  dropoff_address: "55 Wall St., New York, NY",
  oversize: false,
  rush: false,
)

t1 = Ticket.create(
  client_id: schmitt.id,
  pickup_address: schmitt.address,
  dropoff_address: "3 Battery Park, New York, NY",
  oversize: false,
  rush: false,
)

t2 = Ticket.create(
  client_id: schmitt.id,
  pickup_address: schmitt.address,
  dropoff_address: "500 21st St, Long Island City, NY",
  oversize: false,
  rush: true,
)

# BDO has some carpet samples coming in to East Village
t3 = Ticket.create(
  client_id: bdc.id,
  pickup_address: bdc.address,
  dropoff_address: '25 Ave. A, New York, NY',
  oversize: true,
  rush: false,
)

# Millenium has a standard going over to Schmitt
t4 = Ticket.create(
  client_id: mic.id,
  pickup_address: mic.address,
  dropoff_address: schmitt.address,
  oversize: false,
  rush: false,
)

# Using faker to make a bunch more clients
10.times do 
  Client.create(
    name: Faker::Company.name,
    address: Faker::Address.street_address,
    contact_person: Faker::Name.name,
    contact_phone: Faker::PhoneNumber.phone_number
  )
end
