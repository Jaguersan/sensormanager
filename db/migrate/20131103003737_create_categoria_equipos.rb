class CreateCategoriaEquipos < ActiveRecord::Migration
  def change
    create_table :categoria_equipos do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
