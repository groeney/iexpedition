require "csv"
CSV.foreach("./db/seeds/data/ships.csv", :headers => true) do |row|
  ship_obj = row.to_hash.symbolize_keys!
  operator = extract_or_create_resource("Operator", ship_obj, "operator_name")
  create_or_update_singleton("Ship", ship_obj.merge({ operator: operator }))
end