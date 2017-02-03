require "csv"
Dir["./db/seeds/data/*-voyages.csv"].each do |fn|
  CSV.foreach(fn, :headers => true) do |row|
    voyage_obj = row.to_hash.symbolize_keys!.except(:days)
    ship_obj = {
      name: voyage_obj.delete(:ship_name),
      operator_name: voyage_obj.delete(:ship_operator_name),
      category: voyage_obj.delete(:ship_category)
    }

    ship = Ship.find_by(ship_obj)
    if !ship
      puts "No ship found #{ship_obj}. Try running `rake db:seed:ships` first."
      return
    end

    if !ship.valid?
      puts "Could not create voyage #{voyage_obj} because ship not valid #{ship.errors.full_messages}"
      return
    end


    voyage_obj[:start_date] = Date.parse(voyage_obj[:start_date])
    voyage_obj[:end_date] = Date.parse(voyage_obj[:end_date])

    voyage = Voyage.find_or_create_by(voyage_obj)
    if !voyage.valid?
      puts "Could not create voyage #{voyage_obj[:name]} because #{voyage.errors.full_messages}"
      return
    else
      ship.voyages << voyage
      puts "Created voyage #{voyage.name}"
    end
  end
end