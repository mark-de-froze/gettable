json.extract! reservation, :id, :table, :starts_at, :ends_at, :created_at, :updated_at
json.url restaurant_table_reservation_url(@restaurant, @table, reservation, format: :json)
