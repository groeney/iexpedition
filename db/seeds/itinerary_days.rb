require "csv"
Dir["./db/seeds/data/*itinerary-days-#{TYPE}.csv"].each do |fn|
  CSV.foreach(fn, :headers => true) do |row|
    itinerary_day_obj = clean_data row.to_hash.symbolize_keys!

    voyage = extract_voyage(itinerary_day_obj)
    day_number = itinerary_day_obj.delete(:day_number)
    singleton = create_singleton("ItineraryDay", itinerary_day_obj)
    association_obj = { itinerary_day_id: singleton.id, day_number: day_number }

    associate_singleton_with_groupings_collection(voyage.itinerary_day_groupings,
                                                  association_obj) if voyage.try(:valid?)
  end
end