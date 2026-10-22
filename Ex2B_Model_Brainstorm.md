# Requirements and Conceptual Model 
Idasha Lee and Thania Sta. Ana
Someone who wants to look up events going on or the managers who need to keep track of venues and events. They should be able to see all the local events going on
Important different categories to track would be the category code, employee #, Venue ID, and Event ID. 

# Category code 
 - Event category
# Employee Number
-Event manager
-Email
# Venu Id
-Venue name
-Address
-City
-State
-Zip
-Contact name
-Contact email
-Contact phone
# Event Id
-Event name
-Event date

cat code, employee id, venue id 

2.
a) categories managers venues and events are 4 entitites
b) attributes : Managers - Employee # (PK), event manager, manager email. Venue -Venue ID (PK), Ven Location, Location Address, Location City, Location State, Location Zip, Venue COntact Name, ven Email, Ven Phone. Events - Event id (pk), event name, event date, cat code foreign key, employee # (fk), venue id (fK)
c) categories 1 ---< Events (Many) manager 1 ---< events many venues 1 ---< events many
d) events >---< managers events >---<categories  events>----< venues
