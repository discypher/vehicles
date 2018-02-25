# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
vehicles = Vehicle.create([{ kind: 'Car'}, { kind: 'Truck' }])
makes = Make.create([{ manufacturer: 'Tesla' }, { manufacturer: 'Toyota' }])
options = Option.create(
  [
    {name: 'Heated Seats', cost: 100.00, description: 'For a warm butt when it\'s cold outside'},
    {name: 'Navigation System', cost: 150.00, description: 'Always getting lost? This can help!'},
    {name: '4 Door', cost: 120.00, description: 'For those of you who have more than 1 friend!'},
    {name: 'V6 Engine', cost: 200.00, description: 'Get there faster if there\'s no traffic.'},
    {name: 'Fancy Rims', cost: 300.00, description: 'Impress your friends with shiny rims!'},
    {name: 'Ski Rack', cost: 120.00, description: 'Put your skis on top instead of in the trunk.'},
    {name: 'Keyless Entry', cost: 90.00, description: 'Car unlocks when you\'re in range.'}
  ]
)
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

model1.options << options[1]
model1.options << options[3]
model1.options << options[5]
model1.options << options[6]

model2.options << options[0]
model2.options << options[2]
model2.options << options[4]
model2.options << options[6]
