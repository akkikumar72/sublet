json.array!(@paces) do |pace|
  json.extract! pace, :id, :title, :price, :size, :description, :address, :zipcode, :email, :active
  json.url pace_url(pace, format: :json)
end
