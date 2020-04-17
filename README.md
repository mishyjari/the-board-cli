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



  *---- This project is licensed under the terms of the MIT license. ----*


