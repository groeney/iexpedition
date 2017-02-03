require "csv"
Dir["./db/seeds/data/*-activities.csv"].each do |fn|
  CSV.foreach(fn, :headers => true) do |row|
    activity_obj = row.to_hash.symbolize_keys!
    voyage_obj = {
      name: activity_obj.delete(:voyage_name),
      start_date: Date.parse(activity_obj.delete(:voyage_start_date)),
      end_date: Date.parse(activity_obj.delete(:voyage_end_date))
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

    activity_obj[:voyage_id] = voyage.id
    activity = Activity.find_or_create_by(activity_obj)
    if !activity.valid?
      puts "Could not create activity #{activity_obj[:class]} because #{activity.errors.full_messages}"
    else
      voyage.activities << activity
      puts "Created activity #{activity.name}"
    end
  end
end