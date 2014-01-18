class Concentrador < ActiveRecord::Base
  belongs_to :categoria_equipo
  has_many :sensors
  has_many :medidas, :through => :sensors

  validates :nombre, format: { with: /([\w\s\-\_]*)/, message: "only allows letters and - _" }, uniqueness: {message: " debe ser unico"}, presence: { message: "Obligatorio"}
  validates :categoria_equipo, :estado, presence: { message: "Obligatorio"}
  validates :gis_latitud, :gis_longitud, numericality: true
end
