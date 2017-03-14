require "csv"
Dir["./db/seeds/data/*destinations-#{TYPE}.csv"].each do |fn|
  new_file(fn)
  CSV.foreach(fn, :headers => true) do |row|
    destination_obj = clean_data row.to_hash.symbolize_keys!
    create_singleton("Destination", destination_obj)
  end
end