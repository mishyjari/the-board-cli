##TO-DO LIST FOR THE BOARD

*mark complete by switching '-' to 'x'*

##MIGRATIONS
- Remove dispatcher table if we're not gonna use it
- Add required flags to appropriate props on all tables
- Add 'time ready' column to tickets
	- Currently ready == time ordered, but we can use the t.timestamps to mark the ordered time and default ready to now if not specified otherwise
- Add default values to approprate props
- Add 'Oversize details' column to tickets

##MODELS AND METHODS

**Courier**
	.clear_couriers
		- Couriers with no incomplete tickets assigned to them
	#last_drop
		- Returns ticket instance for the most recently completed ticker assigned to courier
	#tickets_today_by_courier
	#tickets_by_date_range_by_courier

**Ticket**
	.tickets_today_all
	.tickets_today_completed
	.tickets_by_date_range(d1,d2)
	#is_late?
	#is_rush?
		- Will cooerce the rush attribute to 'true' if passed a custom time due < 3 hours from time ready

**Client**
	.find_by_name
	.clients_with_incomplete_tickets
	#incomplete_tickets_by_client
	#tickets_today_by_client
	#tickets_by_date_range_by_client(d1,d2)

##CLI MENUS

**General**
- Make sure time defaults to localtime not UTC
x Clear the terminal in between displays (puts `clear`)
- Try to find a gem that listens for keyboard events
x Factor out menu and view files based on board
- Write display method that prints input at a certain length (determined by arg)

**All three LIST methods should be changed/built to take an array as an argument. This will let us select and sort instances via class methods and just pass the return of said method into the lister method. This will make the remaining analytics and sorting tasks 10000x easier**

**Demo Menu**
- Attach to about? Maybe right in the main menu?
- Shortcuts to a few stand out features
- Shortcuts to add new client/courier/ticket forms
- Feature that can create 'n' number of of random clients, tickets or couriers
	- Do this with Faker. Theres already one to make clients in the seeds file. Just needs to be pulled out into its own little method (probably put this in app/resources/helpers and just have a method for randomizing one of each class)
- Reword the seeds file be randomized every time and populate with tickets and couriers in different arrangements

**Head**
- Make it prettier
- Format time

**Create New Interfaces**
- Build out new ticket interface
 - Take a client instance as an argument
 - Create a new client instance called 'guest' to handle tickets not from clients
- *Impliment new courier interface*
- New client form
	- Handle input of client instance / search by name
	- Add exit feature

**Main Menu**
x Update menu items to be more accurate
	x Ticket Board
	x Courier Board
	x Client Board
	x Search Options
	x About
	x Exit
x Add carrot

**Ticket Board**
x Make header prettier
x Default to menu only
x Add carrot
x Restructure menu
	x Ticket details by id
	x New ticket
	x Completed tickets (today)
	x Incomplete tickets
	x Unassigned tickets
	x Search by date
	x Switch to client board
	x Switch to courier board
	x Main menu
	x Exit

	*Ticket Detail View*
		x Remove double display of ticket
		x Add line for each attribute
		- Reformat time displays
		x *Assign Courier*
			x Add carrot
			x Exceptions revert to assign menu, not job detail menu
		- *Complete Ticket*
			x Add carrot
			x Line break beneath ticket detail
			- Add handler for custom drop time
			x Add handler to add notes
			x Add confirmation dialogue
	x Implement *add notes to ticket*
	x Implement *Edit Ticket*
	x Implement *Delete Ticket*
	x Implement *Switch to courier/client views*
	- Implement *Search*
	- Implement *New Ticket*
	x Implement *Completed, incomplete and unassigned tickets* options
	x Implement *Accept Job*
		x Switches status from 'pending' to 'incomplete' without assigning it

	*List Tickets*
	- Make it as DRY as possible, ONE method that can be passed args
	x Should be more compact, 2-3 lines each, max
	x Should have "LATE" flag if current time > due time
	- Should default to sort by time submitted
		- Impliment features to sort by status, time due, company name, courier name... and DRY
	- Should have a limit of how many are displayed on a page with a default value and an optional user-defined value
		- Should have prev/next options if applicable

**Courier Board**
	x Default to menu only (not list)
	- Build out menu options
		x List active couriers
		x List all couriers
		x Show clear coriers
		- Add new courier
		x Switch to Client Board
		x Switch to Ticket Board
		- *Impliment search by name*
	*List Couries*
		- Add num of packages today (theres a class method for pkgs today in the courier model)
		- Add LATE flag if they're holding any late packages
	*Courier Detail*
		- Display name, id, active status, num holding, num today, LATE flag, last drop addr + time
		x Display all incomplete tix assigned to self
		- Menu
			x Mark active/inactive
			- Assign ticket to this courier (list unassigned tix)
			- Edit details
			- View completed tickets today
			- View tickets by date range (search)
			- Delete courier
			x Back to courier board
			x Back to main menu
			x Exit application

**Client Board**
	- Client detail view
		- Remove first "CLIENT" from heading line
		- Add when client was created
		- Add number of jobs today/this month
		- List incomplete tickets for this client
		- Add new ticket for this client
		- Rename menu items for consistency
			- Change t to tickets today
			- *Impliment search by date*
	- Client list
		- Add address and num incomplete packages
	- *Impliment search by name*
