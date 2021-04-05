class ModifyTrackingDescription < ActiveRecord::Migration[6.1]
  def change
    remove_column :trackings, :descripcion
    add_column :trackings, :desde, :string
    add_column :trackings, :hasta, :string
  end
end
