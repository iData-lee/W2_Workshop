# Requirements and Conceptual Model 
Idasha Lee and Thania Sta. Ana
Someone who wants to look up events going on or the managers who need to keep track of venues and events. They should be able to see all the local events going on
Important different categories to track would be the category code, employee #, Venue ID, and Event ID. 

# Category code 
 - Event category
# Employee Number
 - Event manager
 - Email
# Venue Id 
 - Venue name
 - Address
 - City
 - State
 - Zip
 - Contact name
 - Contact email
 - Contact phone
# Event Id
 - Event name
 - Event date

cat code, employee id, venue id 

# Logical Model
a) The four main entities to include would be categories, managers, venues, and events.
b) Attributes : Managers - Employee # (PK), event manager, manager email. Venue - Venue ID (PK), Venue Location, Location Address, Location City, Location State, Location Zip, Venue Contact Name, Venue Email, Venue Phone. Events - Event ID (PK), event name, event date, category code (fk), employee # (fk), venue id (fK)
c) Categories to Events is 1 to many: categories 1 ---< Events (Many). Manager can be 1 to many Events: manager 1 ---< events. There can be 1 Venue to many events:
venues 1 ---< events many
d) Many to many relationships that will need a resolving table includes: events >---< managers, events >---< categories, events >----< venues
