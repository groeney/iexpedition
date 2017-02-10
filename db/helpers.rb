def parse(obj)
  result_obj = obj.to_hash.symbolize_keys!
end

def create_singleton(class_name, obj)
  klass = Object.const_get class_name

  if !(singleton = klass.find_or_create_by(obj))
    raise "Could not create #{class_name} #{obj}."
  elsif !singleton.valid?
    raise "Could not create #{class_name} #{obj} because #{singleton.errors.full_messages}."
  else
    puts "Created #{class_name} #{singleton.name}."
    return singleton
  end
end

def associate_singleton_with_collection(collection, singleton)
  if collection.exists?(singleton)
    puts "Association between #{singleton.name} and #{collection.name} already exists."
    return collection
  elsif !(collection << singleton)
    raise "Could not associate #{singleton.name} with #{collection.name}."
  else
    puts "Created #{singleton.class.name} #{singleton.name}"
    return collection
  end
end

def extract_resource(class_name, obj, key)
  klass = Object.const_get class_name
  resource_name = obj.delete(key.to_sym)
  if !(resource = klass.find_by_name(resource_name))
    binding.pry
    raise "Could not find #{class_name} #{resource_name}."
  elsif !resource.valid?
    raise "#{class_name} #{resource.name} not valid because #{resource.errors.full_messages}."
  else
    return resource
  end
end

def extract_voyage(ship, obj)
  voyage_obj = {
    name: obj.delete(:voyage_name),
    start_date: obj.delete(:voyage_start_date),
    end_date: obj.delete(:voyage_end_date)
  }

  if !(voyage = ship.voyages.find_by(voyage_obj))
    raise "No voyage found for voyage object #{voyage_obj} and ship #{ship.name}. Try running `rake db:seed:voyages` first."
  else
    return voyage
  end
end

def clean_data(obj)
  date_keys = [:start_date, :end_date, :voyage_start_date, :voyage_end_date]
  obj.delete_if { |key,value| key == :single_supplement && value.nil? }
  obj.update(obj) {
    |key,value| date_keys.include?(key) ? Date.parse(value) : value
  }
end
