require "csv"
Dir["./db/seeds/data/*destination-activities-#{TYPE}.csv"].each do |fn|
  new_file(fn)
  CSV.foreach(fn, :headers => true) do |row|
    destination_activity_obj = clean_data row.to_hash.symbolize_keys!
    destination = extract_resource("Destination", destination_activity_obj, "destination_name")
    next unless destination.try(:valid?)
    destination_activity_obj.merge!({ destination_id: destination.id })
    singleton = create_singleton("DestinationActivity", destination_activity_obj)
  end
end