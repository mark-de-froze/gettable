json.extract! table, :id, :restaurant, :number_table, :created_at, :updated_at
json.url restaurant_table_url(@restaurant, table, format: :json)
