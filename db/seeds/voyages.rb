require_relative "../helpers"
require "csv"

Dir["./db/seeds/data/*voyages-#{TYPE}.csv"].each do |fn|
  new_file(fn)
  CSV.foreach(fn, :headers => true) do |row|
    voyage_obj = clean_data row.to_hash.symbolize_keys!
    operator = extract_resource("Operator", voyage_obj, "operator_name")
    ship = nil
    ship_name = voyage_obj.delete(:ship_name)
    next if operator.nil?
    ship = operator.ships.where(name: ship_name).first
    missing_data("Ship", ship_name) if ship.nil?

    destination = extract_resource("Destination", voyage_obj, "destination_name")
    regions = extract_named_resources(voyage_obj, :region_names, "Region")
    inclusions = extract_or_create_named_resources(voyage_obj, :inclusion_names, "Inclusion")
    exclusions = extract_or_create_named_resources(voyage_obj, :exclusion_names, "Exclusion")

    voyage_obj.merge!({
      destination: destination,
      ship: ship,
    })

    gallery_images = extract_gallery_images(voyage_obj)

    singleton = create_singleton("Voyage", voyage_obj)

    regions.each do |region|
      associate_singleton_with_collection(singleton.regions, region) unless region.nil?
    end

    inclusions.each do |inclusion|
      associate_singleton_with_collection(singleton.inclusions, inclusion) unless inclusion.nil?
    end

    exclusions.each do |exclusion|
      associate_singleton_with_collection(singleton.exclusions, exclusion) unless exclusion.nil?
    end

    gallery_images.each do |gallery_image|
      associate_singleton_with_collection(singleton.gallery_images, gallery_image) unless gallery_image.nil?
    end

    associate_singleton_with_collection(ship.voyages, singleton) unless ship.nil?
  end
end