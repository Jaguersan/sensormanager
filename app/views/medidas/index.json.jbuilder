json.array!(@medidas) do |medida|
  json.extract! medida, :id, :sensor_id, :fecha, :valor
  json.url medida_url(medida, format: :json)
end
