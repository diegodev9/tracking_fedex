class AddDescription < ActiveRecord::Migration[6.1]
  def change
    add_column :trackings, :description, :string
  end
end
