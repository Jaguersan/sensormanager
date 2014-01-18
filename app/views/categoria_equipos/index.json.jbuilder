json.array!(@categoria_equipos) do |categoria_equipo|
  json.extract! categoria_equipo, :nombre, :descripcion
  json.url categoria_equipo_url(categoria_equipo, format: :json)
end
