require "csv"
Dir["./db/seeds/data/*voyages.csv"].each do |fn|
  CSV.foreach(fn, :headers => true) do |row|
    voyage_obj = clean_data row.to_hash.symbolize_keys!
    operator = extract_resource("Operator", voyage_obj, "operator_name")
    ship = operator.ships.where(name: voyage_obj.delete(:ship_name)).first
    destination = extract_resource("Destination", voyage_obj, "destination_name")
    region_names = voyage_obj.delete(:region_names).split(',')
    regions = region_names.map { |region_name| Region.find_by_name(region_name) }
    voyage_obj.merge!({
      destination: destination,
      ship: ship,
    })

    existing_resource = Voyage.where({
                                      name: voyage_obj[:name],
                                      start_date: voyage_obj[:start_date],
                                      end_date: voyage_obj[:end_date]
                                    })
    singleton = create_or_update_singleton("Voyage", voyage_obj, existing_resource)
    regions.each do |region|
      associate_singleton_with_collection(singleton.regions, region)
    end
    associate_singleton_with_collection(ship.voyages, singleton)
  end
end