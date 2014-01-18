class CategoriaEquipo < ActiveRecord::Base
	has_many :concentradors
	has_many :sensors, :through => :concentradors
	has_many :medidas, :through => :sensors

	validates :nombre, format: { with: /(\w\s\-\_]*)/, message: "only allows letters and - _" }, uniqueness: {message: " debe ser unico"}, presence: { message: "Obligatorio"}

end
