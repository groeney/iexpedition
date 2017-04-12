require_relative "../helpers"
require "csv"

Dir["./db/seeds/data/*ships-#{TYPE}.csv"].each do |fn|
  new_file(fn)
  CSV.foreach(fn, :headers => true) do |row|
    ship_obj = clean_data row.to_hash.symbolize_keys!
    features = extract_or_create_named_resources(ship_obj, :feature_names, "Feature")
    operator = extract_or_create_resource("Operator", ship_obj, "operator_name")
    missing_data("Operator", row.to_hash.symbolize_keys![:operator_name]) if operator.nil?
    gallery_images = extract_gallery_images(ship_obj)
    singleton = create_singleton("Ship", ship_obj.merge({ operator: operator })) unless operator.nil?
    gallery_images.each do |gallery_image|
      associate_singleton_with_collection(singleton.gallery_images, gallery_image) unless gallery_image.nil?
    end
    features.each do |feature|
      associate_singleton_with_collection(singleton.features, feature) unless feature.nil?
    end
  end
end