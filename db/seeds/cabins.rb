require "csv"
Dir["./db/seeds/data/*-cabins.csv"].each do |fn|
  CSV.foreach(fn, :headers => true) do |row|
    cabin_obj = row.to_hash.symbolize_keys!
    cabin_obj.delete_if {|key,value| key == :single_supplement && value.nil?}
    voyage_obj = {
      name: cabin_obj.delete(:voyage_name),
      start_date: Date.parse(cabin_obj.delete(:voyage_start_date)),
      end_date: Date.parse(cabin_obj.delete(:voyage_end_date))
    }

    voyage = Voyage.find_by(voyage_obj)
    if !voyage
      puts "No voyage found #{voyage_obj}. Try running `rake db:seed:voyages` first."
      return
    end

    if !voyage.valid?
      puts "Could not create voyage #{voyage_obj[:name]} because voyage not valid #{voyage.errors.full_messages}"
      return
    end

    cabin_obj[:voyage_id] = voyage.id
    cabin = Cabin.find_or_create_by(cabin_obj)
    if !cabin.valid?
      puts "Could not create cabin #{cabin_obj[:name]} because #{cabin.errors.full_messages}"
    else
      voyage.cabins << cabin
      puts "Created cabin #{cabin.name}"
    end
  end
end