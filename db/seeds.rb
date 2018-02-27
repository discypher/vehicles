# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
    make: makes.first,
    base_cost: 25_000.00,
    name: 'Model 3',
    year: 2015
  }
)

model2 = Model.create(
  {
    make: makes.second,
    base_cost: 30_000.00,
    name: 'Tacoma',
    year: 2012
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

vehicle1 = Vehicle.create(
  make_id: makes.first.id,
  model_id: model1.id,
  owner: "Joe Schmoe",
  miles: 100_000,
  condition: 'Like New',
  vin: '1234asdf4321fdsa'
)

vehicle1.options << options[1]
vehicle1.options << options[3]
vehicle1.options << options[6]


vehicle2 = Vehicle.create(
  make_id: makes.second.id,
  model_id: model2.id,
  owner: "Jim Schim",
  miles: 300_000,
  condition: 'Poor',
  vin: '2234asdf4321fdsa'
)

vehicle2.options << options[0]
vehicle2.options << options[2]
vehicle2.options << options[6]
