require "csv"
Dir["./db/seeds/data/*activities-#{TYPE}.csv"].each do |fn|
  CSV.foreach(fn, :headers => true) do |row|
    activity_obj = clean_data row.to_hash.symbolize_keys!

    voyage = extract_voyage(activity_obj)
    singleton = create_singleton("Activity", activity_obj)

    associate_singleton_with_collection(voyage.activities, singleton) if voyage.try(:valid?)
  end
end