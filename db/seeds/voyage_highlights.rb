require "csv"
Dir["./db/seeds/data/*voyage-highlights-#{TYPE}.csv"].each do |fn|
  new_file(fn)
  CSV.foreach(fn, :headers => true) do |row|
    highlight_obj = clean_data row.to_hash.symbolize_keys!
    voyage = extract_voyage(highlight_obj)
    singleton = create_singleton("Highlight", highlight_obj)

    next unless voyage.try(:valid?)

    association_obj = { highlight_id: singleton.id }
    associate_singleton_with_groupings_collection(voyage.highlight_groupings, association_obj) if voyage.try(:valid?)
  end
end