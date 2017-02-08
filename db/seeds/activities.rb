require "csv"
Dir["./db/seeds/data/activities.csv"].each do |fn|
  CSV.foreach(fn, :headers => true) do |row|
    activity_obj = clean_data row.to_hash.symbolize_keys!

    ship = extract_resource("Ship", activity_obj, "ship_name")
    voyage = extract_voyage(ship, activity_obj)

    activities = associate_singleton_with_collection(
                                                      voyage.activities,
                                                      create_singleton("Activity", activity_obj)
                                                    )
  end
end