# Add seed data here. Seed your database with `rake db:seed`

# Sophie Turner and Joe Jonas
sj = User.create(username: "sophieandjoe", password: "got")
# Colin Khoo and Araminta Lee
ca = User.create(username: "colinandaraminta", password: "cra")
# Priyanka Chopra and Nick Jonas
pn = User.create(username: "priyankaandnick", password: "jonas")

kitchen = Category.create(name: "Kitchen")
electronics = Category.create(name: "Electronics")
fitness_and_outdoors = Category.create(name: "Fitness & Outdoors")
patio_and_garden = Category.create(name: "Patio & Garden")
travel = Category.create(name: "Travel")

Item.create(name: "coffeemaker", category_id: kitchen.id, user_id: sj.id)
Item.create(name: "flatware", category_id: kitchen.id, user_id: sj.id)
Item.create(name: "barware", category_id: kitchen.id, user_id: sj.id)
Item.create(name: "juicer", category_id: kitchen.id, user_id: ca.id)
Item.create(name: "dinnerware", category_id: kitchen.id, user_id: ca.id)
Item.create(name: "bakeware", category_id: kitchen.id, user_id: ca.id)
Item.create(name: "dutch oven", category_id: kitchen.id, user_id: pn.id)
Item.create(name: "cheese board", category_id: kitchen.id, user_id: pn.id)
Item.create(name: "waffle maker", category_id: kitchen.id, user_id: pn.id)

Item.create(name: "TV", category_id: electronics.id, user_id: sj.id)
Item.create(name: "Nest Thermostat", category_id: electronics.id, user_id: sj.id)
Item.create(name: "Amazon Echo with Alexa", category_id: electronics.id, user_id: ca.id)
Item.create(name: "Ring Video Doorbell", category_id: electronics.id, user_id: pn.id)

Item.create(name: "weights", category_id: fitness_and_outdoors.id, user_id: sj.id)
Item.create(name: "bosu ball", category_id: fitness_and_outdoors.id, user_id: sj.id)
Item.create(name: "fitness trackers", category_id: fitness_and_outdoors.id, user_id: ca.id)
Item.create(name: "treadmill", category_id: fitness_and_outdoors.id, user_id: ca.id)
Item.create(name: "bikes", category_id: fitness_and_outdoors.id, user_id: pn.id)
Item.create(name: "airbed", category_id: fitness_and_outdoors.id, user_id: pn.id)
Item.create(name: "tent", category_id: fitness_and_outdoors.id, user_id: pn.id)

Item.create(name: "fire pit", category_id: patio_and_garden.id, user_id: sj.id)
Item.create(name: "grill", category_id: patio_and_garden.id, user_id: ca.id)
Item.create(name: "garden lights", category_id: patio_and_garden.id, user_id: ca.id)
Item.create(name: "cooler", category_id: patio_and_garden.id, user_id: pn.id)

Item.create(name: "carry-on bag", category_id: travel.id, user_id: sj.id)
Item.create(name: "luggage set", category_id: travel.id, user_id: ca.id)

# rake db:reset (drops db, reloads schema, then seeds db)
# to reseed after changing schema - drop, create, migrate, seed