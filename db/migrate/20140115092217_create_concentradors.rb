class CreateConcentradors < ActiveRecord::Migration
  def change
    create_table :concentradors do |t|
      t.belongs_to :categoria_equipo, index: true
      t.string :nombre, :unique => true
      t.string :descripcion
      t.string :estado
      t.float :gis_latitud, :default => 0.0
      t.float :gis_longitud, :default => 0.0
      t.string :mac_address
      t.string :numero_serie
      t.string :ip_address, :default => 80
      t.integer :ip_port

      t.timestamps
    end
  end
end
