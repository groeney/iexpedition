require_relative "../helpers"
require "csv"

Dir["./db/seeds/data/*ships-#{TYPE}.csv"].each do |fn|
  CSV.foreach(fn, :headers => true) do |row|
    ship_obj = clean_data row.to_hash.symbolize_keys!
    operator = extract_or_create_resource("Operator", ship_obj, "operator_name")
    missing_data("Operator", row.to_hash.symbolize_keys![:operator_name]) if operator.nil?
    create_singleton("Ship", ship_obj.merge({ operator: operator })) if !operator.nil?
  end
end