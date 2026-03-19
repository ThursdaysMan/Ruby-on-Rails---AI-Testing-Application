class AddMapIdToUserLayers < ActiveRecord::Migration[7.2]
  def change
    add_reference :user_layers, :map, null: false, foreign_key: true
  end
end
