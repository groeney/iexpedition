require "csv"
Dir["./db/seeds/data/*destinations-#{TYPE}.csv"].each do |fn|
  new_file(fn)
  CSV.foreach(fn, :headers => true) do |row|
    destination_obj = clean_data row.to_hash.symbolize_keys!
    gallery_images = extract_gallery_images(destination_obj)
    singleton = create_singleton("Destination", destination_obj)
    gallery_images.each do |gallery_image|
      associate_singleton_with_collection(singleton.gallery_images, gallery_image) unless gallery_image.nil?
    end
  end
end