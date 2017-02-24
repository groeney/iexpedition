TYPE = ENV.fetch("seed_type", "example")
require_relative "./helpers"
require_relative "./seeds/admins"

new_resource("Destinations")
require_relative "./seeds/destinations"
new_resource("Regions")
require_relative "./seeds/regions"
new_resource("Ships")
require_relative "./seeds/ships"
new_resource("Voyages")
require_relative "./seeds/voyages"
new_resource("Cabins")
require_relative "./seeds/cabins"
new_resource("Activities")
require_relative "./seeds/activities"
