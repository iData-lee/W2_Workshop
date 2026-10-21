b)Someone who wants to look up events going on. Everyone who wants to look up the events.
 Different categories of cat code employee # venue id and event Id 

c)For category code put event category. Employee number event manager, 
email. Venu Id venue name, address, city, state, zip, contact name, contact email, contact phone. Event Id event name, event date, cat code, employee id, venue id 

2.
a) categories managers venues and events are 4 entitites
b) attributes : Managers - Employee # (PK), event manager, manager email. Venue -Venue ID (PK), Ven Location, Location Address, Location City, Location State, Location Zip, Venue COntact Name, ven Email, Ven Phone. Events - Event id (pk), event name, event date, cat code foreign key, employee # (fk), venue id (fK)
c) categories 1 ---< Events (Many) manager 1 ---< events many venues 1 ---< events many
d) events >---< managers events >---<categories  events>----< venues