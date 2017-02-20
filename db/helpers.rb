def parse(obj)
  result_obj = obj.to_hash.symbolize_keys!
end

def create_or_update_singleton(class_name, obj, relation=nil)
  klass = Object.const_get class_name
  relation = klass.where(name: obj[:name]) if relation.nil?
  if !(relation.update_or_create!(obj))
    raise "Could not create #{class_name} #{obj}."
  else
    puts "Created #{class_name} #{relation.first.name}."
    return relation.first
  end
end

def associate_singleton_with_collection(collection, singleton)
  if collection.exists?(singleton.id)
    puts "Association between #{singleton.name} and #{collection.name} already exists."
    return collection
  elsif !(collection << singleton)
    raise "Could not associate #{singleton.name} with #{collection.name}."
  else
    puts "Created #{singleton.class.name} #{singleton.name}"
    return collection
  end
end

def extract_or_create_resource(class_name, obj, key)
  klass = Object.const_get class_name
  resource_name = obj.delete(key.to_sym)
  if !(resource = klass.find_or_create_by(name: resource_name))
    raise "Could not create #{class_name} #{resource_name}."
  elsif !resource.valid?
    raise "#{class_name} #{resource.name} not valid because #{resource.errors.full_messages}."
  else
    return resource
  end
end

def extract_resource(class_name, obj, key)
  klass = Object.const_get class_name
  resource_name = obj.delete(key.to_sym)
  if !(resource = klass.find_by_name(resource_name))
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
