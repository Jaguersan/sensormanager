class CreateMedidas < ActiveRecord::Migration
  def change
    create_table :medidas do |t|
      t.belongs_to :sensor, index: true, :default => 1
      t.date :fecha
      t.float :valor

      t.timestamps
    end
  end
end
