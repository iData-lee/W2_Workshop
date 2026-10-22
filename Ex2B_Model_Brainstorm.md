# Requirements and Conceptual Model 
Idasha Lee and Thania Sta. Ana

Lana should be able to track all her clients and their dogs and any other walkers she may hire also. She should be able to look up all walks for a given day, or client and see what each walker has completed. The important categories to track are Client ID, Dog ID, Walker ID and service code. Each walk being recognized by a walk ID

# Client ID 
 - Client Name
 - Client Email
 - Client Phone
 - Address (Pickup location)
# Dog ID
 - Dog Name
 - Breed
 - Care Notes (behavior, medical, feeding)
# Walker ID
 - Walker Name
 - Walker Email
 - Walker Phone
# Service Code
 - Service Name (30 min, 60 min and/or group session walks)
 - Duration in Minutes
 - Standard Pricing
# Walk ID
 - Walk Date and Start Time
 - Amount Charged
 - Walk Notes

# Logical Model
a) The five main entities to include would be Clients, Dogs, Walkers, Service Types and Walks.

b) Attributes : Clients - client id (PK), client name, client email, client phone, address (city,state,zip).
Dogs - Dog ID (PK), dog name, breed, care notes, client id (fk).
Walkers - walker id, walker name, walker phone, walker email. 
Service Types - Service code (PK), service name, duration in minutes, standard price.
Walks - walk id (PK), walk date, start time, amount charged, walk notes, dog id (FK), walker id (FK), service code (FK).

c) Clients to Dogs is one to many. Dogs to walks is one to many. Walkers to walks is one to many. Service Types to walks is one to many.

d) Group walks are many-to-many between Walks and Dogs, resolved with a WALK_DOGS table
