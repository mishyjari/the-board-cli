# **THE BOARD**
### **An interactive CLI application for courier services**


**Developed by**

 - Michelle Frattaroli
 - Kat Maldon



**Concept**

Real-time package delivery can be a fast-paced environment with a great deal of moving pieces. Courier companies use a dispatch board to bring together clients' delivery requests with the individual couriers making the deliveries.
Having the ability to view, edit, assign, and complete active deliveries in a single easy to navigate application is crucial to the smooth operation of this time-sensitive service.

**Application Structure**

Designed with the needs of the dispatcher in mind, we created an intuitive command line interface. Easy menu navigation allows dispatchers to respond to clients' needs by submitting new job requests, view and update ticket statuses, and update courier details for any job.


### **Install and initialize:**

- Clone this repository: https://github.com/mishyjari/the-board
- Run `bundle install` in your terminal
- Run `rake db:seed` to add seed data
- Run `ruby bin/run.rb` to enter THE BOARD

The app will open and present the MAIN MENU:

  `[t] TICKET board`

  `[c] COURIER board`

  `[i] CLIENT board`

  `[s] SEARCH options`

  `[a] ABOUT`

  `[x] EXIT`

 ### **Navigation:**

Menus are navigated via text input: simply select the letter in front of the desired option to move into sub menus and forms. Core functionality includes viewing all tickets, clients, and couriers, divided into pending/assigned/complete and active/inactive, all packages by client or courier, flags for late tickets, and individual search. You can create, view, edit, or delete tickets, clients, and couriers.

#### **Additonal Information:**

This application comes as the Mod 1 Project for Flatiron School's Software Engineering Boot Camp. It is the culmination of lessons on Ruby, relational models, ActiveRecord, and SQLite.
It is built in a single-user format, where the 'user' is the dispatcher at a courier company.

The dispatcher can view their active couriers and incomplete jobs, assigning tickets to couriers that match the packages they're already holding. When a client calls in with a new delivery request, the dispatcher enters the ticket into the board, associates it with the client and assigns it to a courier. If a client isn't registered, an account can be created, or the ticket can be submitted as a 'GUEST'.
After the courier has delivered a package, they call in to dispatch and confirm the point-of-delivery (POD). The dispatcher adds that info and marks the ticket complete.


#### **Models:**

This application uses three models:

- Ticket: *belongs_to* courier and *belongs_to* client
- Courier:  *has_many* tickets and *has_many* clients *through* tickets
- Client: *has_many* tickets and *has_many* couriers *through* tickets

The Courier and Client models contain basic information about the clients and methods to access tickets associated with them.
The Ticket model takes in pickup and drop off information, delivery status, details pertaining to that job and foreign_ids.

*RUSH* tickets are due within 1 hour after time ready, all other tickets are due within three hours.

#### **Upcoming features:**

- Allow manual entry of *datetime* for *time_ready*, *time_due*, *dropoff_time* by converting a user-entered string ('04/01/2020' or '18:30') into a *Time object*
- Search for couriers and clients by name, address, etc.
- Sorting to change the order lists of instances are printed
- Maximum number of items displayed per page with *prev/next* menu options to page through

#### **Known bugs:**
- Time instances seem to switch between UTC and local. Creates issues especially with the makers that say if a ticket is *LATE*.
- NewTicket *add_notes* will append *new_notes* (by design) but will not allow an already inserted note to be removed.


#### **License:**
This project is licensed under the terms of the MIT license. Please refer to `LICENSE` for full use details.


