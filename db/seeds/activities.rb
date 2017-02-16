require "csv"
Dir["./db/seeds/data/activities.csv"].each do |fn|
  CSV.foreach(fn, :headers => true) do |row|
    activity_obj = clean_data row.to_hash.symbolize_keys!

    ship = extract_resource("Ship", activity_obj, "ship_name")
    voyage = extract_voyage(ship, activity_obj)
    existing_resource = Activity.voyage(voyage.id).where(name: activity_obj[:name])
    singleton = create_or_update_singleton("Activity", activity_obj, existing_resource)

    associate_singleton_with_collection(voyage.activities, singleton)
  end
end