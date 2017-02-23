require_relative "../helpers"
require "csv"

Dir["./db/seeds/data/*voyages-#{TYPE}.csv"].each do |fn|
  CSV.foreach(fn, :headers => true) do |row|
    voyage_obj = clean_data row.to_hash.symbolize_keys!
    operator = extract_resource("Operator", voyage_obj, "operator_name")
    ship = nil
    if !operator.nil?
      ship_name = voyage_obj.delete(:ship_name)
      ship = operator.ships.where(name: ship_name).first
      missing_data("Ship", ship_name) if ship.nil?
    end

    destination = extract_resource("Destination", voyage_obj, "destination_name")
    region_names = (voyage_obj.delete(:region_names) || "").split(',').map { |region_name| region_name.strip }
    regions = region_names.map { |region_name|
                                  region = Region.find_by_name(region_name)
                                  missing_data("Region", region_name) if region.nil?
                                  region
                               }
    voyage_obj.merge!({
      destination: destination,
      ship: ship,
    })

    singleton = create_singleton("Voyage", voyage_obj)
    regions.each do |region|
      associate_singleton_with_collection(singleton.regions, region) if !region.nil?
    end
    associate_singleton_with_collection(ship.voyages, singleton) if !ship.nil?
  end
end