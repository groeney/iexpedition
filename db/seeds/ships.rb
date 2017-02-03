require "csv"
Dir["./db/seeds/data/*-ship.csv"].each do |fn|
  CSV.foreach(fn, :headers => true) do |row|
    ship_obj = row.to_hash.symbolize_keys!
    ship = Ship.find_or_create_by(ship_obj)
    if !ship.valid?
      puts "Could not create ship #{ship_obj[:name]} because #{ship.errors.full_messages}"
    else
      puts "Created ship #{ship.name}"
    end
  end
end