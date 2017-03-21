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
new_resource("ItineraryDays")
require_relative "./seeds/itinerary_days"
new_resource("Wildlife")
require_relative "./seeds/wildlives"
new_resource("Destination Highlights")
require_relative "./seeds/destination_highlights"
new_resource("Voyage Highlights")
require_relative "./seeds/voyage_highlights"
new_resource("Histories")
require_relative "./seeds/histories"
new_resource("Facts")
require_relative "./seeds/facts"
new_resource("Inclusions")
require_relative "./seeds/inclusions"

