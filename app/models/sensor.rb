class Sensor < ActiveRecord::Base
  belongs_to :concentrador
  has_many :medidas

  validates :nombre, format: { with: /([\w\s\-\_]*)/, message: "only allows letters and - _" }, uniqueness: {message: " debe ser unico"}, presence: { message: "Campo Obligatorio"}
  validates :concentrador, :estado, :parametro, :valor, presence: { message: "Campo Obligatorio"}
  validates :valor, numericality: true
end
