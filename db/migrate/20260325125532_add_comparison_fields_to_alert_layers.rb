class AddComparisonFieldsToAlertLayers < ActiveRecord::Migration[7.2]
  def change
    add_column :alert_layers, :comparison_base_date, :datetime
    add_column :alert_layers, :threshold_user, :float
  end
end
