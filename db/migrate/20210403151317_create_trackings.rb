class CreateTrackings < ActiveRecord::Migration[6.1]
  def change
    create_table :trackings do |t|
      t.string :nombre
      t.string :guia
      t.string :estado
      t.string :descripcion

      t.timestamps
    end
  end
end
