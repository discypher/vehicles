# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
vehicles = Vehicle.create([{ kind: 'Car'}, { kind: 'Truck' }])
makes = Make.create([{ manufacturer: 'Tesla' }, { manufacturer: 'Toyota' }])
model1 = Model.create(
  {
    vehicle: vehicles.first,
    make: makes.first,
    base_cost: 25_000.00,
    name: 'Model 3'}
)

model2 = Model.create(
  {
    vehicle: vehicles.second,
    make: makes.second,
    base_cost: 30_000.00,
    name: 'Tacoma'
  }
)
