def parse(obj)
  result_obj = obj.to_hash.symbolize_keys!
end

def create_singleton(class_name, obj)
  klass = Object.const_get class_name
  singleton = klass.find_or_create_by(obj)
  if singleton.nil?
    raise "Could not create #{class_name} #{obj}."
  elsif !singleton.valid?
    resource_error(singleton)
  else
    puts "Created #{class_name} #{singleton.inspect}."
  end
  singleton
end

def associate_singleton_with_collection(collection, singleton)
  unless singleton.try(:valid?)
    resource_error(singleton)
    return collection
  end
  if collection.exists?(singleton.id)
    puts "Association between #{singleton.inspect} and #{collection.name} already exists."
  elsif !(collection << singleton)
    raise "Could not associate #{singleton.inspect} with #{collection.name}."
  else
    puts "Created association #{singleton.class.name} #{singleton.inspect}"
  end
  collection
end

def associate_singleton_with_groupings_collection(groupings_collection, obj)
  grouping = groupings_collection.create(obj)
  if !grouping.valid?
    resource_error(grouping)
  else
    puts "Created grouping #{grouping.class.name} #{grouping}"
  end
  groupings_collection
end

def extract_or_create_resource(class_name, obj, key)
  klass = Object.const_get class_name
  resource_name = obj.delete(key.to_sym)
  if !(resource = klass.find_or_create_by(name: resource_name))
    raise "Could not create #{class_name} #{resource_name}."
  elsif !resource.valid?
    resource_error(resource)
  end
  resource
end

def extract_resource(class_name, obj, key)
  klass = Object.const_get class_name
  resource_name = obj.delete(key.to_sym)
  if !(resource = klass.find_by_name(resource_name))
    missing_data(class_name, resource_name)
  elsif !resource.valid?
    resource_error(resource)
  end
  resource
end

def extract_voyage(obj)
  voyage_obj = {
    name: obj.delete(:voyage_name),
    start_date: obj.delete(:voyage_start_date),
    end_date: obj.delete(:voyage_end_date),
  }
  ship = extract_ship(obj)
  return resource_error(ship) if !ship.try(:valid?)
  voyages = ship.voyages.where(voyage_obj)

  voyage = nil
  if voyages.blank?
    missing_data("Voyage", voyage_obj[:name])
    puts "Ship: #{ship.name}. Operator: #{ship.operator.name}"
  elsif voyages.length > 1
    raise "More than one voyage found for #{voyage_obj} and ship #{ship.name}. See for yourself: #{voyages}"
  else
    voyage = voyages.first
  end
  voyage
end

def extract_ship(obj)
  ship = nil
  ship_name = obj.delete(:ship_name)
  operator = extract_resource("Operator", obj, "operator_name")
  if !operator.nil?
    if (ships = operator.ships.where(name: ship_name)).empty?
      missing_data("Ship", ship_name)
      puts "Operator: #{operator.name}"
    elsif ships.length > 1
      raise "More than one ship found for #{ship_name} under operator #{operator.name}."
    else
      ship = ships.first
    end
  end
  ship
end

def clean_data(obj)
  date_keys = [:start_date, :end_date, :voyage_start_date, :voyage_end_date]
  not_nullable_keys = [:single_supplement, :availability, :dedicated_sole_occupancy,
                       :discount_amount, :gst]
  obj.delete_if { |key,value| not_nullable_keys.include?(key) && value.nil? }
  obj.update(obj) {
    |key,value| (date_keys.include?(key) && !value.nil?) ? Date.parse(value) : value
  }
  obj.update(obj) {
    |key,value| value.is_a?(String) ? value.strip : value
  }
end

def missing_data(resource_type, name)
  puts "### Missing data ### #{resource_type} '#{name}'"
end

def resource_error(resource)
  puts "### Model errors ### #{resource.try(:class).try(:name)}: #{resource.try(:errors).try(:full_messages)}"
  puts "Details: #{resource.try(:inspect)}"
end

def new_resource(resource_name)
  puts "### New resource ### #{resource_name}"
end

def new_file(filename)
  puts "### New file ### #{filename}"
end

def extract_names(obj, key)
  (obj.delete(key) || "").split(',').map { |name| name.strip }
end

def extract_or_create_named_resources(obj, key, class_name)
  extract_names(obj, key).map do |name|
    klass = Object.const_get class_name
    klass.find_or_create_by(name: name)
  end
end

def extract_named_resources(obj, key, class_name)
  extract_names(obj, key).map do |name|
    klass = Object.const_get class_name
    resource = klass.find_by_name(name)
    missing_data(resource.class.name, resource) if resource.nil?
    resource
  end
end
