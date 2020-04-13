#THE BOARD

*Developers*
- Michelle Frattaroli
- Kat Maldon

*Concept*
Real-time package delivery can be a fast-paced environment with a great deal of moving pieces. Courier companies use a dispatch board to bring together clients' delivery request with the individual couriers making the deliveries. Having an easy way for a dispatcher to view, edit, assign and complete active deliveries is crucial to the smooth operation of a time-sensitive service.

*Application Structure*
For the scope of this CLI application, we will assume that the user is the dispatcher, with clients submitting job requests and couriers holding packages.
It is the responsibility of the dispatcher/user to look at pending tickets and match the routes up with their couriers.

On load, the user will be presented a menu:
- Show tickets
	- Incomplete
	- Unassigned
	- Completed (by date, default=today)
	- By pickup zone/borough
	- By delivery zone/borough
	- By courier :: incomplete
	- By courier :: complete (by date, default=today)
	- Late tickets prioritize to top of menu
- Show couriers - default to name, zones/borougs currently holding, num packages holding, num total for today
	- Be able to search for a courier's deliveries by date and by client
	- Get a list of all late deliveries
- Show clients
	- List all clients
	- List all clients with incomplete deliveries
	- Search for a client's deliveries by date

---

Menus will be navigated by a printed index (*maybe just use id?*) for each row item. An example 'incomplete job board' may look like this:

			INCOMPLETE JOBS
	ID	CLIENT					PICKUP ADDR				DROPOFF ADDR			RECIEVED			DUE				STATUS			COURIER
	71	Meow, Inc				1 Kitten Place			The cat house			Today, 12:30		Today, 15:30	Pending			n/a
	34	Schmitt and Schmitt		767 5th Ave, NY, NY		11 Broadway NY, NY		Today, 12:51		Today, 15:51	Unassigned		n/a
	63	BDC						250 Atlantic Ave, Brook 1 WTC, #4500			Today, 13:10		Today, 14:10	Assigned		Michelle

... and the user will be presented menu options in the following format
	[:id] Enter the ID of a ticket to edit, view, assign or complete
	[b] Press 'b' to return to the main menu
	[n] Press 'n' to enter a new ticket
	[x] Press 'x' to quit

---

... let's say that the dispatcher wants to accept and assign the pending job from Meow, Inc,
>> 71 [enter]

	DETAILS FOR TICKET #71 :: PENDING
	- Client Name; Meow, Inc
	- Pickup Address: 1 Kitten Place
	- Delivery Address: The Cat House
	- Recieved [timestamp info]
	- Due [timestamp info]
	- Oversize? No
	- Rush? No.
	- POD: n/a
	- Delivery Time: n/a
	- Courier: n/a
	
	[a] Press a to ASSIGN
	[b] Press b to go BACK
	[c] Press c to COMPLETE 
	[e] Press e to EDIT
	[d] Press d to DELETE
	[x] Press x to EXIT

>> a [enter]

	*The application will then display a list of active couriers and ask the dispatcher which courier it should be assigned to*

		COURIERS
	ID	NAME		# HOLDING	# TODAY	# ZONES HOLDING
	2	Michelle	4			18		UES, LIC
	5	Kevin		2			21		DT
	3	Jocelyn		0			25		n/a

	ASSIGN JOB #71 to which courier (enter ID)
>> 2 [enter]

>> JOB #71 ASSIGNED TO MICHELLE

---

**COMPLETE TICKET** will be gived a pod (point-of-delivery) and an optional time (default=now)
**NEW TICKET** will list clients and create ticket for that client with line-by-line data input
**SEARCH BY DATE** Will take a start date, end date, courier or client and populate results
**DELETE** Will have confirmation prompt
